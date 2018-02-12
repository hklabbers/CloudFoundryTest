//
// Created by Hans Klabbers on 22-11-17.
//
#include <sstream>
#include "service/TimeZoneConversionHandler.h"
#include "Poco/Net/HTTPServerRequest.h"
#include "Poco/Net/HTTPServerResponse.h"
#include "trompeloeil.hpp"
#include "catch.hpp"

extern template struct trompeloeil::reporter<trompeloeil::specialized>;

class HTTPServerRequestMock : public Poco::Net::HTTPServerRequest {

public:
    MAKE_CONST_MOCK0( getContentType, const std::string&() );
    MAKE_CONST_MOCK0( clientAddress, const Poco::Net::SocketAddress&(), override );
    MAKE_MOCK0( stream, std::istream&(), override);
    MAKE_CONST_MOCK0( expectContinue, bool());
    MAKE_CONST_MOCK0( serverAddress, const Poco::Net::SocketAddress&(), override);
    MAKE_CONST_MOCK0( serverParams, const Poco::Net::HTTPServerParams&(), override);
    MAKE_CONST_MOCK0( response, Poco::Net::HTTPServerResponse&(), override);
    MAKE_CONST_MOCK0( secure, bool(), override );
};

class HTTPServerResponseMock : public Poco::Net::HTTPServerResponse {

public:
    MAKE_MOCK0( sendContinue, void(), override);
    MAKE_MOCK0( send, std::ostream&(), override);
    MAKE_MOCK2( sendFile, void(const std::string&, const std::string&), override);
    MAKE_MOCK2( sendBuffer, void(const void*, std::size_t), override);
    MAKE_MOCK2( redirect, void(const std::string&, Poco::Net::HTTPResponse::HTTPStatus), override);
    MAKE_MOCK1( requireAuthentication, void(const std::string&), override);
    MAKE_CONST_MOCK0( sent, bool(), override);
};

 SCENARIO("Requestor requests a time zone conversion", "[TimeZoneConversionHandler]") {
    GIVEN("A Call") {
        WHEN("Call received") {

            HTTPServerRequestMock httpServerRequestMock { };
            HTTPServerResponseMock httpServerResponseMock { };

            const std::string contentType{"application/json"};
            httpServerRequestMock.setContentType(contentType);

            const Poco::Net::SocketAddress address{"192.168.2.1:8080"};
            ALLOW_CALL(httpServerRequestMock, clientAddress())
            .RETURN(address);

            std::string inString { "{ \"TimeZoneFrom\":\"Europe/London\", \"TimeZoneTo\":\"Europe/Amsterdam\", "
                                           "\"Year\":2017,\"Month\":3,\"Day\":20,\"HourIn24H\":15,\"Minute\":25 }" };
            std::stringstream inputStream { inString, std::ios::in };
            ALLOW_CALL(httpServerRequestMock, stream())
            .LR_RETURN(inputStream);

            std::string outString { };
            std::stringstream outputStream { outString, std::ios::out };
            ALLOW_CALL(httpServerResponseMock, send())
            .LR_RETURN(outputStream);

            TimeZoneConversionHandler handler { };
            handler.handleRequest(httpServerRequestMock, httpServerResponseMock);

            std::string expectedResult = "{ \"ConvertedDateTime\": \"2017-03-20 16:25:00.000000000 CET\" }\n";
            std::string result = outputStream.str();
            REQUIRE(result == expectedResult);
        }
    }
}

//
// Created by Hans Klabbers on 24-10-17.
//

#include <date/tz.h>
#include "service/TimeZoneValidationHandler.h"
#include "Poco/Net/HTTPServerRequest.h"
#include "Poco/Net/HTTPServerResponse.h"
#include "Poco/JSON/Parser.h"

TimeZoneValidationHandler::TimeZoneValidationHandler()  { }

void TimeZoneValidationHandler::handleRequest(Poco::Net::HTTPServerRequest& request,
                                              Poco::Net::HTTPServerResponse& response) {
    l.information("Request from " + request.clientAddress().toString());

    if (request.getContentType() == "application/json") {

        std::istream &is = request.stream();
        Poco::JSON::Parser parser { };
        Poco::JSON::Query jsonQuery { parser.parse(is) };

        const std::string timeZone = getTimeZone(jsonQuery);
        const bool isValid = isValidTimeZone(timeZone);

        response.setChunkedTransferEncoding(true);
        response.setContentType("application/json");
        response.setStatusAndReason(Poco::Net::HTTPResponse::HTTP_OK);
        std::ostream &out = response.send();
        out << "{\"ValidatedTimeZone\" : \"" << (isValid == true ? "TRUE" : "FALSE") << "\"}";
    } else {
        l.information("Request content type is wrong, should be application/json, got " + request.getContentType());
    }
}

const std::string TimeZoneValidationHandler::getTimeZone(const Poco::JSON::Query query) {
    const std::string timeZone { (query.find(TIMEZONE).isEmpty() ? "" : query.find(TIMEZONE).convert<std::string>()) };
    l.debug("timeZone: " + timeZone);
    return timeZone;
}

const bool TimeZoneValidationHandler::isValidTimeZone(const std::string timeZone) {
    const auto& timeZones = date::get_tzdb().zones;
    bool foundTimeZone = false;
    for(auto it = timeZones.begin(); it != timeZones.end(); it++) {
        if (timeZone == it->name()) {
            foundTimeZone = true;
            break;
        }
    }
    return foundTimeZone;
}
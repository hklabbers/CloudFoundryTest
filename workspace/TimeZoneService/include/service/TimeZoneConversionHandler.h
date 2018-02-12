//
// Created by Hans Klabbers on 7-11-17.
//

#ifndef TIMEZONESERVICE_TIMEZONECONVERSIONHANDLER_H
#define TIMEZONESERVICE_TIMEZONECONVERSIONHANDLER_H

#include "Poco/Net/HTTPRequestHandler.h"
#include "Poco/Logger.h"
#include "Poco/JSON/Query.h"
#include "date/date.h"
#include "ConversionParameters.h"

class TimeZoneConversionHandler :public Poco::Net::HTTPRequestHandler {
public:
    void handleRequest(Poco::Net::HTTPServerRequest& request, Poco::Net::HTTPServerResponse& response) override ;

private:
    Poco::Logger &l = Poco::Logger::get("ConversionParameters");
    std::string convert(ConversionParameters parameters);
    void sendInvalidRequestType(Poco::Net::HTTPServerResponse &response);
    void sendInvalidJSONProvided(Poco::Net::HTTPServerResponse &response, const std::vector<std::string>& errors);
    void sendResult(Poco::Net::HTTPServerResponse &response, const std::string result);
};

#endif //TIMEZONESERVICE_TIMEZONECONVERSIONHANDLER_H
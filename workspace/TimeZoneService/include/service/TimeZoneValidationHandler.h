//
// Created by Hans Klabbers on 24-10-17.
//

#ifndef TIMEZONESERVICE_TIMEZONEVALIDATIONHANDLER_H
#define TIMEZONESERVICE_TIMEZONEVALIDATIONHANDLER_H

#include <Poco/JSON/Query.h>
#include "Poco/Net/HTTPRequestHandler.h"
#include "Poco/Logger.h"

class TimeZoneValidationHandler : public Poco::Net::HTTPRequestHandler {
public:
    TimeZoneValidationHandler();
    void handleRequest(Poco::Net::HTTPServerRequest& request, Poco::Net::HTTPServerResponse& response);

private:
    Poco::Logger &l = Poco::Logger::get("TimeZoneValidationtHandler");
    const std::string TIMEZONE { "TimeZone" };
    const std::string getTimeZone(const Poco::JSON::Query query);
    const bool isValidTimeZone(const std::string timeZone);
};


#endif //TIMEZONESERVICE_TIMEZONEVALIDATIONHANDLER_H

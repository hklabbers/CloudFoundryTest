//
// Created by Hans Klabbers on 6-11-17.
//

#ifndef TIMEZONESERVICE_TIMEZONELISTHANDLER_H
#define TIMEZONESERVICE_TIMEZONELISTHANDLER_H

#include <Poco/Net/HTTPRequestHandler.h>
#include "Poco/Net/HTTPServerRequest.h"
#include "Poco/Logger.h"

class TimeZoneListHandler : public Poco::Net::HTTPRequestHandler {
public:
    TimeZoneListHandler();
    void handleRequest(Poco::Net::HTTPServerRequest& request, Poco::Net::HTTPServerResponse& response);

private:
    Poco::Logger &l = Poco::Logger::get("TimeZoneConversiontHandler");
    const std::string createTimeZoneList();
};


#endif //TIMEZONESERVICE_TIMEZONELISTHANDLER_H

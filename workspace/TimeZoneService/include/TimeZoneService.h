//
// Created by Hans Klabbers on 24-10-17.
//

#ifndef TIMEZONESERVICE_TIMEZONESERVICE_H
#define TIMEZONESERVICE_TIMEZONESERVICE_H

#include "Poco/Util/ServerApplication.h"
#include "Poco/ConsoleChannel.h"
#include "Poco/Logger.h"
#include "Poco/AutoPtr.h"

class TimeZoneService : public Poco::Util::ServerApplication {

public:
    TimeZoneService();
    int main(const std::vector<std::string> &args);

private:
    //Poco::AutoPtr<Poco::ConsoleChannel> pChannel;
    Poco::Logger &l =  Poco::Logger::get("TimeZoneService");
    const std::string PORT { "PORT" };
    void showLogLevel();
    const Poco::UInt16 getPort();
};
#endif //TIMEZONESERVICE_TIMEZONESERVICE_H

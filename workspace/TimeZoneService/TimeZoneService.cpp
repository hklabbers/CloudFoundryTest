#include <iostream>
#include <sstream>
#include "TimeZoneService.h"
#include "Poco/Net/ServerSocket.h"
#include "Poco/Net/HTTPServerParams.h"
#include "Poco/Net/HTTPServer.h"
#include "Poco/Environment.h"
#include "service/HandlerFactory.h"

int main() {

    Poco::AutoPtr<Poco::ConsoleChannel> pChannel;
    pChannel = new Poco::ConsoleChannel;
    Poco::Logger::root().setChannel(pChannel);
    Poco::Logger::root().setLevel(Poco::Message::PRIO_TRACE);
    Poco::Logger::root().information("Starting TimeZoneService.");

    TimeZoneService tzs { } ;
    std::vector<std::string> args { };
    tzs.main(args);

    return 0;
}

int TimeZoneService::main(const std::vector<std::string> &args) {

    Poco::Net::ServerSocket socket(getPort());
    std::string listenMessage { "The timezone service listens on: localhost: " };
    listenMessage += std::to_string(getPort());
    l.information(listenMessage);
    //Use log declaration in file. And default thingy when not found.
    Poco::Net::HTTPServerParams *pParams = new Poco::Net::HTTPServerParams();
    pParams->setMaxQueued(100);
    pParams->setMaxThreads(16);

    Poco::Net::HTTPServer server(new HandlerFactory(), socket, pParams);
    server.start();

    waitForTerminationRequest();

    server.stop();

    return EXIT_OK;
}

TimeZoneService::TimeZoneService() {
    showLogLevel();
}

void TimeZoneService::showLogLevel() {
    std::string message{"Loglevel is "};
    switch (l.getLevel()) {
        case Poco::Message::PRIO_FATAL:
            message += "fatal.";
            break;
        case Poco::Message::PRIO_CRITICAL:
            message += "critical.";
            break;
        case Poco::Message::PRIO_ERROR:
            message += "error.";
            break;
        case Poco::Message::PRIO_WARNING:
            message += "warning.";
            break;
        case Poco::Message::PRIO_NOTICE:
            message += "notice.";
            break;
        case Poco::Message::PRIO_INFORMATION:
            message += "information.";
            break;
        case Poco::Message::PRIO_DEBUG:
            message += "debug.";
            break;
        case Poco::Message::PRIO_TRACE:
            message += "trace.";
            break;
    }
    l.information(message);
}

const Poco::UInt16 TimeZoneService::getPort() {
    Poco::UInt16 port = 9999;
    Poco::Environment env { };
    if (env.has(PORT)) {
        std::string::size_type stringSize;
        port = std::stoi(env.get(PORT), &stringSize);
        l.information("TimeZoneService listens on port: " + env.get(PORT));
    } else {
        l.information("No PORT environment variable, TimeZoneService listens to default port 9999.");
    }
    return port;
}
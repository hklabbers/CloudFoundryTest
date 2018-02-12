//
// Created by Hans Klabbers on 13-11-17.
//
#define CATCH_CONFIG_RUNNER
#include "catch.hpp"
#include "trompeloeil.hpp"
#include "Poco/Logger.h"
#include "Poco/ConsoleChannel.h"
#include "Poco/AutoPtr.h"

int main( int argc, char* argv[] )
{
    Poco::AutoPtr<Poco::ConsoleChannel> pChannel;
    pChannel = new Poco::ConsoleChannel;
    Poco::Logger::root().setChannel(pChannel);
    Poco::Logger::root().setLevel(Poco::Message::PRIO_TRACE);
    Poco::Logger::root().information("Starting TimeZoneService.");

    Catch::Session session; // There must be exactly one instance

    // writing to session.configData() here sets defaults
    // this is the preferred way to set them

    int returnCode = session.applyCommandLine( argc, argv );
    if( returnCode != 0 ) // Indicates a command line error
        return returnCode;

    // writing to session.configData() or session.Config() here
    // overrides command line args
    // only do this if you know you need to

    int numFailed = session.run();

    // numFailed is clamped to 255 as some unices only use the lower 8 bits.
    // This clamping has already been applied, so just return it here
    // You can also do any post run clean-up here
    return numFailed;
}

namespace trompeloeil {
    template <>
    void reporter<specialized>::send(severity s, const char *file, unsigned long line, const char *msg) {

        std::ostringstream os;
        if (line) os << file << ':' << line << '\n';
        os << msg;
        auto failure = os.str();
        if (s == severity::fatal) {
            FAIL(failure);
        } else {
            CAPTURE(failure);
            CHECK(failure.empty());
        }
    }
}


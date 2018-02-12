//
// Created by Hans Klabbers on 13-11-17.
//
#include <sstream>
#include <iostream>
#include <service/ConversionParameters.h>
#include <Poco/JSON/Parser.h>
#include "catch.hpp"

SCENARIO("Perfect set of parameters", "[ConversionParameters]") {
    GIVEN("A JSON with all the needed parameters")
        GIVEN("Parameters are in the correct format") {
            std::string jsonString = "{ \"TimeZoneFrom\":\"Europe/London\", \"TimeZoneTo\":\"Europe/Amsterdam\","
                    "\"Year\":2017,\"Month\":3,\"Day\":20,\"HourIn24H\":15,\"Minute\":25}";
            std::stringstream is{jsonString, std::ios::in};

            Poco::JSON::Parser parser{};
            ConversionParameters parameters{};
            WHEN("JSON is parsed") {
                try {
                    Poco::JSON::Query jsonQuery{parser.parse(is)};
                    REQUIRE (parameters.parseJSON(jsonQuery) == true);
                } catch (Poco::JSON::JSONException &e) {
                    std::cout << "JSON Parse exception. " << e.displayText() << std::endl;
                }
                REQUIRE(parameters.getTimeZoneFrom() == "Europe/London");
                REQUIRE(parameters.getTimeZoneTo() == "Europe/Amsterdam");
                auto ymd = date::year(2017) / date::month(3) / 20;
                std::chrono::system_clock::time_point tp =
                        date::sys_days(ymd) + std::chrono::hours(15) + std::chrono::minutes(25);
                REQUIRE(parameters.getDateTimeToBeConverted() == tp);
            }
        }
}
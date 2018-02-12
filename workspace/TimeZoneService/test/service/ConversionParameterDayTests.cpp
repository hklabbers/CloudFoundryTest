//
// Created by Hans Klabbers on 15-11-17.
//
#include <sstream>
#include <iostream>
#include <service/ConversionParameters.h>
#include <Poco/JSON/Parser.h>
#include "catch.hpp"

SCENARIO("Set of parameters; Day is missing", "[ConversionParameters]") {
    GIVEN("A JSON with the needed parameters (except year)")
        GIVEN("Parameters are in the correct format") {
            std::string jsonString = "{ \"TimeZoneFrom\":\"Europe/London\", \"TimeZoneTo\":\"Europe/Amsterdam\","
                    "\"Year\":2017,\"Month\":3,\"HourIn24H\":15,\"Minute\":25}";
            std::stringstream is{jsonString, std::ios::in};

            Poco::JSON::Parser parser{};
            ConversionParameters parameters{};
            WHEN("JSON is parsed") {
                try {
                    Poco::JSON::Query jsonQuery{parser.parse(is)};
                    REQUIRE (parameters.parseJSON(jsonQuery) == false);
                } catch (Poco::JSON::JSONException &e) {
                    std::cout << "JSON Parse exception. " << e.displayText() << std::endl;
                }
                REQUIRE(parameters.getTimeZoneFrom() == "Europe/London");
                REQUIRE(parameters.getTimeZoneTo() == "Europe/Amsterdam");
                REQUIRE(parameters.getParameterErrors().size() == 1);
                REQUIRE(parameters.getParameterErrors().at(0) == "Day - parameter not given.");
            }
        }
}

SCENARIO("Set of parameters; Day is not an integer", "[ConversionParameters]") {
    GIVEN("A JSON with all the needed parameters") {
        std::string jsonString = "{ \"TimeZoneFrom\":\"Europe/London\", \"TimeZoneTo\":\"Europe/Amsterdam\","
                "\"Year\":2017,\"Month\":3,\"Day\":\"20\",\"HourIn24H\":15,\"Minute\":25}";
        std::stringstream is{jsonString, std::ios::in};

        Poco::JSON::Parser parser{};
        ConversionParameters parameters{};
        WHEN("JSON is parsed") {
            try {
                Poco::JSON::Query jsonQuery{parser.parse(is)};
                REQUIRE (parameters.parseJSON(jsonQuery) == false);
            } catch (Poco::JSON::JSONException &e) {
                std::cout << "JSON Parse exception. " << e.displayText() << std::endl;
            }
            REQUIRE(parameters.getTimeZoneFrom() == "Europe/London");
            REQUIRE(parameters.getTimeZoneTo() == "Europe/Amsterdam");
            REQUIRE(parameters.getParameterErrors().size() == 1);
            REQUIRE(parameters.getParameterErrors().at(0) == "Day - parameter is not an integer.");
        }
    }
}

SCENARIO("Set of parameters; Day is 32", "[ConversionParameters]") {
    GIVEN("A JSON with all the needed parameters") {
        std::string jsonString = "{ \"TimeZoneFrom\":\"Europe/London\", \"TimeZoneTo\":\"Europe/Amsterdam\","
                "\"Year\":2017,\"Month\":3,\"Day\":32,\"HourIn24H\":15,\"Minute\":25}";
        std::stringstream is{jsonString, std::ios::in};

        Poco::JSON::Parser parser{};
        ConversionParameters parameters{};
        WHEN("JSON is parsed") {
            try {
                Poco::JSON::Query jsonQuery{parser.parse(is)};
                REQUIRE (parameters.parseJSON(jsonQuery) == false);
            } catch (Poco::JSON::JSONException &e) {
                std::cout << "JSON Parse exception. " << e.displayText() << std::endl;
            }
            REQUIRE(parameters.getTimeZoneFrom() == "Europe/London");
            REQUIRE(parameters.getTimeZoneTo() == "Europe/Amsterdam");
            REQUIRE(parameters.getParameterErrors().size() == 1);
            REQUIRE(parameters.getParameterErrors().at(0) == "Day - parameter should be in the range 1 to 31.");
        }
    }
}

SCENARIO("Set of parameters; Day is -12", "[ConversionParameters]") {
    GIVEN("A JSON with all the needed parameters") {
        std::string jsonString = "{ \"TimeZoneFrom\":\"Europe/London\", \"TimeZoneTo\":\"Europe/Amsterdam\","
                "\"Year\":2017,\"Month\":3,\"Day\":-12,\"HourIn24H\":15,\"Minute\":25}";
        std::stringstream is{jsonString, std::ios::in};

        Poco::JSON::Parser parser{};
        ConversionParameters parameters{};
        WHEN("JSON is parsed") {
            try {
                Poco::JSON::Query jsonQuery{parser.parse(is)};
                REQUIRE (parameters.parseJSON(jsonQuery) == false);
            } catch (Poco::JSON::JSONException &e) {
                std::cout << "JSON Parse exception. " << e.displayText() << std::endl;
            }
            REQUIRE(parameters.getTimeZoneFrom() == "Europe/London");
            REQUIRE(parameters.getTimeZoneTo() == "Europe/Amsterdam");
            REQUIRE(parameters.getParameterErrors().size() == 1);
            REQUIRE(parameters.getParameterErrors().at(0) == "Day - RangeException on parameter. Parameter should"
                    " be in the range 1 to 31.");
        }
    }
}

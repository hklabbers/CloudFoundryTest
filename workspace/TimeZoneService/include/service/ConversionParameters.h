//
// Created by Hans Klabbers on 7-11-17.
//

#ifndef TIMEZONESERVICE_CONVERSIONPARAMETERS_H
#define TIMEZONESERVICE_CONVERSIONPARAMETERS_H

#include <chrono>
#include "Poco/JSON/Query.h"
#include "date/date.h"
#include "Poco/Logger.h"

class ConversionParameters {

public:
    bool parseJSON(Poco::JSON::Query qry);
    const std::string &getTimeZoneFrom() const;
    const std::string &getTimeZoneTo() const;
    const std::chrono::system_clock::time_point &getDateTimeToBeConverted() const;
    const std::vector<std::string> &getParameterErrors() const;

private:
    Poco::Logger &l = Poco::Logger::get("ConversionParameters");

    const std::string TIME_ZONE_FROM { "TimeZoneFrom" };
    const std::string TIME_ZONE_TO { "TimeZoneTo" };
    const std::string DAY { "Day" };
    const std::string MONTH { "Month" };
    const std::string YEAR { "Year" };
    const std::string HOUR_IN_24H { "HourIn24H" };
    const std::string MINUTE { "Minute" };

    std::vector<std::string> parseMessages = { };
    std::string timeZoneFrom;
    std::string timeZoneTo;
    Poco::Int16 year;
    Poco::Int8 month;
    Poco::Int8 day;
    Poco::Int8 hour;
    Poco::Int8 minute;
    std::chrono::system_clock::time_point dateTimeToBeConverted;

    bool parseTimeZoneFrom(Poco::JSON::Query qry);
    bool parseTimeZoneTo(Poco::JSON::Query qry);
    bool parseDateTime(Poco::JSON::Query qry);
    bool parseYear(Poco::JSON::Query qry);
    bool parseMonth(Poco::JSON::Query qry);
    bool parseDay(Poco::JSON::Query qry);
    bool parseHour(Poco::JSON::Query qry);
    bool parseMinute(Poco::JSON::Query qry);
};

#endif //TIMEZONESERVICE_CONVERSIONPARAMETERS_H

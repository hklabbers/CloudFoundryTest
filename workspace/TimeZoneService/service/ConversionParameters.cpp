//
// Created by Hans Klabbers on 7-11-17.
//

#include "service/ConversionParameters.h"

bool ConversionParameters::parseJSON(Poco::JSON::Query qry) {
    bool timeZoneFromOk = parseTimeZoneFrom(qry);
    bool timeZoneToOk = parseTimeZoneTo(qry);
    bool dateTimeOk = parseDateTime(qry);
    return timeZoneFromOk && timeZoneToOk && dateTimeOk;
}

bool ConversionParameters::parseTimeZoneFrom(Poco::JSON::Query qry) {
    bool result = false;
    if (!qry.find(TIME_ZONE_FROM).isEmpty()) {
        timeZoneFrom = qry.find(TIME_ZONE_FROM).convert<std::string>();
        l.debug("TimeZoneFrom: " + timeZoneFrom);
        result = true;
    }
    return result;
}

bool ConversionParameters::parseTimeZoneTo(Poco::JSON::Query qry) {
    bool result = false;
    if(!qry.find(TIME_ZONE_TO).isEmpty()) {
        timeZoneTo = qry.find(TIME_ZONE_TO).convert<std::string>();
        l.debug("TimeZoneTo: " + timeZoneTo);
        result = true;
    }
    return result;
}

bool ConversionParameters::parseDateTime(Poco::JSON::Query qry) {
    bool result = false;

    if (parseYear(qry) & parseMonth(qry) & parseDay(qry) & parseHour(qry) & parseMinute(qry)) {
        auto date = date::year(year) / month / day;
        if (date.ok()) {
            dateTimeToBeConverted = date::sys_days(date) + std::chrono::hours(hour) + std::chrono::minutes(minute);
            result = true;
        }
    }
    return result;
}

const std::string &ConversionParameters::getTimeZoneFrom() const {
    return timeZoneFrom;
}

const std::string &ConversionParameters::getTimeZoneTo() const {
    return timeZoneTo;
}

const std::chrono::system_clock::time_point &ConversionParameters::getDateTimeToBeConverted() const {
    return dateTimeToBeConverted;
}

bool ConversionParameters::parseYear(Poco::JSON::Query qry) {
    bool result = false;
    if (qry.find(YEAR).isEmpty()) {
        l.debug("Year parameter not given.");
        parseMessages.push_back(YEAR + " - parameter not given.");
    } else if (!qry.find(YEAR).isInteger()) {
        l.debug("Year parameter is not an integer.");
        parseMessages.push_back(YEAR + " - parameter is not an integer.");
    } else {
        try {
            year = qry.find(YEAR).convert<Poco::UInt16>();
            l.debug("Year: " + std::to_string(year));
            result = true;
        } catch (Poco::RangeException &e) {
            l.debug(YEAR + " - RangeException.");
            parseMessages.push_back(YEAR + " - RangeException on parameter. Parameter should be a positive integer.");
        }
    }
    return result;
}

bool ConversionParameters::parseMonth(Poco::JSON::Query qry) {
    bool result = false;
    if (qry.find(MONTH).isEmpty()) {
        l.debug("Month parameter is not given.");
        parseMessages.push_back(MONTH + " - parameter not given.");
    } else if (!qry.find(MONTH).isInteger()) {
        l.debug(MONTH + " - parameter is not an integer.");
        parseMessages.push_back(MONTH + " - parameter is not an integer.");
    } else {
        try {
            month = qry.find(MONTH).convert<Poco::UInt8>();
            l.debug("Month: " + std::to_string(month));
            if (month < 1 || month > 12) {
                l.debug(MONTH + " - parameter should be 1 to 12.");
                parseMessages.push_back(MONTH + " - parameter should be 1 to 12.");
            } else {
                result = true;
            }
        } catch (Poco::RangeException &e) {
            l.debug(MONTH + " - RangeException.");
            parseMessages.push_back(MONTH + " - RangeException on parameter. Parameter should be 1 to 12.");
        }
    }
    return result;
}

bool ConversionParameters::parseDay(Poco::JSON::Query qry) {
    bool result = false;
    if (qry.find(DAY).isEmpty()) {
        l.debug("Day parameter is not given.");
        parseMessages.push_back(DAY + " - parameter not given.");
    } else if (!qry.find(DAY).isInteger()) {
        l.debug(DAY + " - parameter is not an integer.");
        parseMessages.push_back(DAY + " - parameter is not an integer.");
    } else {
        try {
            day = qry.find(DAY).convert<Poco::UInt8>();
            l.debug("Day: " + std::to_string(day));
            if (day < 1 || day > 31) {
                l.debug(DAY + " - parameter should be in the range 1 to 31.");
                parseMessages.push_back(DAY + " - parameter should be in the range 1 to 31.");
            } else {
                result = true;
            }
        } catch(Poco::RangeException &e) {
            l.debug(DAY + " - RangeException.");
            parseMessages.push_back(DAY + " - RangeException on parameter. Parameter should be in the range 1 to 31.");
        }
    }
    return result;
}

bool ConversionParameters::parseHour(Poco::JSON::Query qry) {
    bool result = false;
    if (qry.find(HOUR_IN_24H).isEmpty()) {
        l.debug("Hour parameter is not given.");
        parseMessages.push_back(HOUR_IN_24H + " - parameter not given.");
    } else if (!qry.find(HOUR_IN_24H).isInteger()) {
        l.debug(HOUR_IN_24H + " - parameter is not an integer.");
        parseMessages.push_back(HOUR_IN_24H + " - parameter is not an integer.");
    } else {
        try {
            hour = qry.find(HOUR_IN_24H).convert<Poco::UInt8>();
            l.debug("Hour: " + std::to_string(hour));
            if (hour < 0 || hour > 23) {
                l.debug(HOUR_IN_24H + " - parameter should be in the range 0 to 23.");
                parseMessages.push_back(HOUR_IN_24H + " - parameter should be in the range 0 to 23.");
            } else {
                result = true;
            }
        } catch (Poco::RangeException &e) {
            l.debug(HOUR_IN_24H + " - RangeException.");
            parseMessages.push_back(HOUR_IN_24H + " - RangeException on parameter. Parameter should be in the range 0 to 23.");
        }
    }
    return result;
}

bool ConversionParameters::parseMinute(Poco::JSON::Query qry) {
    bool result = false;
    if (qry.find(MINUTE).isEmpty()) {
        l.debug("Minute parameter is not given.");
        parseMessages.push_back(MINUTE + " - parameter not given.");
    } else if (!qry.find(MINUTE).isInteger()) {
        l.debug(MINUTE + " - parameter is not an integer.");
        parseMessages.push_back(MINUTE + " - parameter is not an integer.");
    } else {
        try {
            minute = qry.find(MINUTE).convert<Poco::UInt8>();
            l.debug("Minute: " + std::to_string(minute));
            if (minute < 0 || minute > 59) {
                l.debug(MINUTE + " - parameter should be in the range 0 to 59.");
                parseMessages.push_back(MINUTE + " - parameter should be in the range 0 to 59.");
            } else {
                result = true;
            }
        } catch (Poco::RangeException &e) {
            l.debug(MINUTE + " - RangeException.");
            parseMessages.push_back(MINUTE + " - RangeException on parameter. Parameter should be in the range 0 to 59.");
        }
    }
    return result;
}

const std::vector<std::string>& ConversionParameters::getParameterErrors() const {
    return parseMessages;
}
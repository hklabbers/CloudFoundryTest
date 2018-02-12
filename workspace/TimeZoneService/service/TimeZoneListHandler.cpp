//
// Created by Hans Klabbers on 6-11-17.
//

#include "service/TimeZoneListHandler.h"
#include "Poco/Net/HTTPServerResponse.h"
#include "date/tz.h"

TimeZoneListHandler::TimeZoneListHandler() { }

void TimeZoneListHandler::handleRequest(Poco::Net::HTTPServerRequest &request,
                                        Poco::Net::HTTPServerResponse &response) {
    l.information("Request from " + request.clientAddress().toString());

    response.setChunkedTransferEncoding(true);
    response.setContentType("application/json");
    response.setStatusAndReason(Poco::Net::HTTPResponse::HTTP_OK);
    std::ostream &out = response.send();
    out << createTimeZoneList();
}

const std::string TimeZoneListHandler::createTimeZoneList() {
    const auto &timeZones = date::get_tzdb().zones;
    std::string json { "{\"TimeZone\":[" };
    for(auto &tz : timeZones) {
        json.append("\"")
                .append(tz.name())
                .append("\",");
    }
    json.pop_back();
    json.append("]}");
    return json;
}
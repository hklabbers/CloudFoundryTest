//
// Created by Hans Klabbers on 7-11-17.
//
#include <sstream>
#include "service/TimeZoneConversionHandler.h"
#include "Poco/Net/HTTPServerRequest.h"
#include "Poco/Net/HTTPServerResponse.h"
#include "Poco/JSON/Parser.h"
#include "date/tz.h"

void TimeZoneConversionHandler::handleRequest(Poco::Net::HTTPServerRequest &request,
                                              Poco::Net::HTTPServerResponse &response) {
    l.information("Request from " + request.clientAddress().toString());

    response.setChunkedTransferEncoding(true);
    response.setContentType("application/json");

    if (request.getContentType() == "application/json") {

        auto &is = request.stream();
        Poco::JSON::Parser parser { };
        ConversionParameters parameters { };
        try {
            Poco::JSON::Query jsonQuery{parser.parse(is)};
            if (parameters.parseJSON(jsonQuery)) {
                sendResult(response, convert(parameters));
            } else {
                sendInvalidJSONProvided(response, parameters.getParameterErrors());
            }
        } catch (Poco::JSON::JSONException &e) {
            l.information("JSON Parse exception." + e.displayText());
            std::vector<std::string> errorMsg { 1 };
            errorMsg.push_back(e.displayText());
            sendInvalidJSONProvided(response, errorMsg);
        }
    } else {
        l.information("Request content type is wrong, should be application/json, got " + request.getContentType());
        sendInvalidRequestType(response);
    }
}

std::string TimeZoneConversionHandler::convert(ConversionParameters parameters) {

    auto timeZoneFrom = date::make_zoned(parameters.getTimeZoneFrom(),
                                         parameters.getDateTimeToBeConverted());
    auto dateTimeResult = date::make_zoned(parameters.getTimeZoneTo(), timeZoneFrom);

    std::stringstream stringstream;
    stringstream << "From timezone " << parameters.getTimeZoneFrom();
    stringstream << " to timezone " << parameters.getTimeZoneTo();
    stringstream << " with result " << dateTimeResult;
    l.information(stringstream.str());

    stringstream.str(std::string {} );
    stringstream << "{ \"ConvertedDateTime\": \"" << dateTimeResult << "\" }" << std::endl;

    return stringstream.str();
}

void TimeZoneConversionHandler::sendResult(Poco::Net::HTTPServerResponse &response, const std::string result) {

    response.setStatusAndReason(Poco::Net::HTTPResponse::HTTP_OK);

    response.send() << result;
    response.send().flush();
}

void TimeZoneConversionHandler::sendInvalidJSONProvided(Poco::Net::HTTPServerResponse &response,
                                                        const std::vector<std::string> &errors) {
    std::string errorList { };

    for (auto errormsg : errors) {
        errorList += errormsg;
    }

    response.setStatusAndReason(Poco::Net::HTTPResponse::HTTP_BAD_REQUEST, errorList);
    response.send().flush();
}

void TimeZoneConversionHandler::sendInvalidRequestType(Poco::Net::HTTPServerResponse &response) {
    response.setStatusAndReason(Poco::Net::HTTPResponse::HTTP_BAD_REQUEST, "Invalid request type.");
    response.send().flush();
}
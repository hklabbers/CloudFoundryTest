//
// Created by Hans Klabbers on 24-10-17.
//

#include "service/HandlerFactory.h"
#include "service/TimeZoneValidationHandler.h"
#include "service/TimeZoneListHandler.h"
#include "service/TimeZoneConversionHandler.h"

Poco::Net::HTTPRequestHandler * HandlerFactory::createRequestHandler (const Poco::Net::HTTPServerRequest &request) {
    std::cout << "HandlerFactory::createRequestHandler." << std::endl;
    std::cout << request.getURI() << std::endl;

    if (request.getURI() == IS_TIME_ZONE_VALID) {
        return new TimeZoneValidationHandler();
    } else if (request.getURI() == GET_ALL_TIME_ZONES) {
        return new TimeZoneListHandler();
    } else if (request.getURI() == CONVERT_DATE_TIME) {
        return new TimeZoneConversionHandler();
    }
    return nullptr;
}
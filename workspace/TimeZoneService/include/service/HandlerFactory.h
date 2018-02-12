//
// Created by Hans Klabbers on 24-10-17.
//

#ifndef TIMEZONESERVICE_HANDLERFACTORY_H
#define TIMEZONESERVICE_HANDLERFACTORY_H

#include <string>
#include "Poco/Net/HTTPRequestHandlerFactory.h"
#include "Poco/Net/HTTPServerRequest.h"

class HandlerFactory : public Poco::Net::HTTPRequestHandlerFactory {
public:
    Poco::Net::HTTPRequestHandler * createRequestHandler (const Poco::Net::HTTPServerRequest &request);

private:
    const std::string IS_TIME_ZONE_VALID { "/ValidateTimeZone" };
    const std::string GET_ALL_TIME_ZONES { "/AllTimeZones" };
    const std::string CONVERT_DATE_TIME { "/ConvertDateTime"};
};

#endif //TIMEZONESERVICE_HANDLERFACTORY_H

//
// Created by APPLE on 05/12/2024.
//

#ifndef API_H
#define API_H
#include "crow.h"
#include "../Helpers/Auth/JwtHelpers.h"
using namespace std;
using namespace crow;
using namespace crow::json;
inline void addApiRoute(SimpleApp& app) {
    CROW_ROUTE(app, "/api/")([]() {
        wvalue x({{"message", "Hello World!"}});
        return x;
    });

    CROW_ROUTE(app, "/api/encode").methods(HTTPMethod::POST)
    ([] {
        vector<string> permissions = {"read:profile", "write:settings", "delete:account"};

        wvalue x({{"token", encoder("1", "permission", permissions)}});
        return x;
    });

    CROW_ROUTE(app, "/api/decode").methods(HTTPMethod::POST)
    ([](const request& req) {
        auto authorizationToken = req.get_header_value("Authorization").substr(7);
        auto decoded = decoder(authorizationToken);
        return response(decoded.get_payload());
    });
}
#endif //API_H

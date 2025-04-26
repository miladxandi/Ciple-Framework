//
// Created by APPLE on 05/12/2024.
//

#ifndef API_H
#define API_H
#include "crow.h"
#include "../Helpers/Auth/JwtHelpers.h"
#include "../App/Http/Controller/ContentApiController.h"

using namespace std;
using namespace crow;
using namespace crow::json;
using namespace ::App::Http::Controller;

inline void addApiRoute(SimpleApp& app) {
    CROW_ROUTE(app, "/api/cinema/contents").methods(HTTPMethod::GET)
    ([](const request& req) {
        return ContentApiController::index(req);
    });
    CROW_ROUTE(app, "/api/encode").methods(HTTPMethod::POST)
    ([] {
        vector<string> permissions = {"read:profile", "write:profile", "read:contents", "delete:account"};

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

//
// Created by APPLE on 05/12/2024.
//

#ifndef API_H
#define API_H
#include "crow.h"
#include "../Helpers/Auth/JwtHelpers.h"

inline void addApiRoute(crow::SimpleApp& app) {
    CROW_ROUTE(app, "/api/")([]() {
        return "Hello world";
    });

    CROW_ROUTE(app, "/api/encode").methods(crow::HTTPMethod::POST)
    ([] {
        std::vector<std::string> permissions = {"read:profile", "write:settings", "delete:account"};

        crow::json::wvalue x({{"token", encoder("1", "permission", permissions)}});
        return x;
    });

    CROW_ROUTE(app, "/api/decode").methods(crow::HTTPMethod::POST)
    ([](const crow::request& req) {
        auto authorizationToken = req.get_header_value("Authorization").substr(7);
        auto decoded = decoder(authorizationToken);
        return crow::response(decoded.get_payload());
    });
}
#endif //API_H

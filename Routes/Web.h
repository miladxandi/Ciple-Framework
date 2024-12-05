//
// Created by APPLE on 05/12/2024.
//

#ifndef WEB_H
#define WEB_H
#include "crow.h"
#include "../Helpers/Auth/JwtHelpers.h"

inline void addWebRoute(crow::SimpleApp& app) {
    CROW_ROUTE(app, "/")([]() {
        auto page = crow::mustache::load_text("index.html");
        return page;
    });
    CROW_ROUTE(app, "/<string>")([](std::string name){ //
        auto page = crow::mustache::load("variable.html"); //
        crow::mustache::context ctx ({{"person", name}}); //
        return page.render(ctx); //
    });
}
#endif //WEB_H

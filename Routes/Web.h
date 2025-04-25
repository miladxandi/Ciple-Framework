//
// Created by APPLE on 05/12/2024.
//

#pragma once
#define WEB_H
#include "crow.h"
#include "../App/Http/Controller/HomeController.h"
#include "../Helpers/Auth/JwtHelpers.h"
using namespace std;
using namespace crow;
using namespace ::App::Http::Controller;
inline void addWebRoute(SimpleApp &app) {
    CROW_ROUTE(app, "/")([]() {
        return HomeController::index();
    });
    CROW_ROUTE(app, "/form/en")([](const request &req, response &res){
        return res.redirect("https://slvr.formaloo.co/4dushl");
    });
    CROW_ROUTE(app, "/form/ar")([](const request &req, response &res){
        return res.redirect("https://slvr.formaloo.co/yqx8ob");
    });
    CROW_ROUTE(app, "/<string>")([](string name) {
        return HomeController::page(std::move(name));
    });
}

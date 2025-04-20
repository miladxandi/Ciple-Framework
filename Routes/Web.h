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
    HomeController homeController(app);
    CROW_ROUTE(app, "/")([&homeController]() {
        return homeController.index();
    });
    CROW_ROUTE(app, "/<string>")([&homeController](string name) {
        return homeController.page(std::move(name));
    });
}

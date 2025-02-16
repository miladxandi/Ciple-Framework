//
// Created by APPLE on 05/12/2024.
//

#ifndef WEB_H
#define WEB_H
#include <utility>

#include "crow.h"
#include "../App/Http/Controller/HomeController.h"
#include "../Helpers/Auth/JwtHelpers.h"
using namespace std;
using namespace crow;
inline void addWebRoute(SimpleApp& app) {
    CROW_ROUTE(app, "/")([]() {
        return index();
    });
    CROW_ROUTE(app, "/<string>")([](string name){ //
        return page(std::move(name));
    });
}
#endif //WEB_H

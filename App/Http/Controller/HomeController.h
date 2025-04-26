//
// Created by APPLE on 15/02/2025.
//

#pragma once
#include "crow.h"
using namespace std;
using namespace crow::mustache;
namespace App::Http::Controller {
    class HomeController {
        crow::SimpleApp& app;
        public:
            explicit HomeController(crow::SimpleApp& app) : app(app) {} // سازنده
            static string index();
            static rendered_template page(string name);
    };
}
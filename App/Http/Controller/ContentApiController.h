//
// Created by APPLE on 24/04/2025.
//

#pragma once
#include "crow.h"
using namespace std;
using namespace crow;
namespace App::Http::Controller {
    class ContentApiController {
        SimpleApp& app;
    public:
        explicit ContentApiController(SimpleApp& app) : app(app) {} // سازنده
        static response index(const request &req);
    };
}
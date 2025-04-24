//
// Created by APPLE on 24/04/2025.
//

#ifndef CONTENTAPICONTROLLER_H
#define CONTENTAPICONTROLLER_H
#include "crow.h"

using namespace std;
using namespace crow;
using namespace crow::json;
namespace App::Http::Controller {
    class ContentApiController {
        SimpleApp& app;
    public:
        explicit ContentApiController(SimpleApp& app) : app(app) {} // سازنده
        static wvalue index(const request &req);
    };
}


#endif //CONTENTAPICONTROLLER_H

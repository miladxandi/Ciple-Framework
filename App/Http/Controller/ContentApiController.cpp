//
// Created by APPLE on 24/04/2025.
//

#include "ContentApiController.h"
#include "crow.h"
#include "../../../Helpers/Auth/JwtHelpers.h"
#include <sentry.h>
using namespace crow;
using namespace crow::json;
namespace App::Http::Controller {
    wvalue ContentApiController::index(const request &req) {
        sentry_capture_event(sentry_value_new_message_event(
        /*   level */ SENTRY_LEVEL_ERROR,
        /*  logger */ "custom",
        /* message */ "Portion"
        ));
        wvalue x({{"message", "Hello World!"}});
        return x;
    }
}
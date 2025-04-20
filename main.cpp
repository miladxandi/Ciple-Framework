#include "crow.h"
#include "Config/Auth.h"
#include "Helpers/Fs/Reader.h"
#include "Routes/Web.h"
#include "Routes/Api.h"
#include "Helpers/Fs/Dotenv.h"
#include <sentry.h>
int main() {

    sentry_options_t *options = sentry_options_new();
    sentry_options_set_dsn(options, "https://63e9996dd42969649cf294a4847b1934@o4508958548557824.ingest.de.sentry.io/4508958678843472");
    sentry_options_set_database_path(options, ".sentry-native");
    sentry_options_set_release(options, "server@2.3.12");
    sentry_options_set_debug(options, 1);

    sentry_init(options);

    sentry_capture_event(sentry_value_new_message_event(
  /*   level */ SENTRY_LEVEL_INFO,
  /*  logger */ "custom",
  /* message */ "It works!"
    ));

    // make sure everything flushes
    sentry_close();

    dotenv::init("../../.env");
    password = dotenv::getenv("PASSWORD");
    public_key = loadKey(dotenv::getenv("PUBLIC_KEY"));
    private_key = loadKey(dotenv::getenv("PRIVATE_KEY"));

    SimpleApp app;
    set_global_base(dotenv::getenv("TEMPLATES"));

    addWebRoute(app);
    addApiRoute(app);

    app.port(18080).run();

}

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
    // This is also the default-path. For further information and recommendations:
    // https://docs.sentry.io/platforms/native/configuration/options/#database-path
    sentry_options_set_database_path(options, ".sentry-native");
    sentry_backend_t * snt = nullptr;
    sentry_options_set_backend(options, snt); // یا SENTRY_BACKEND_BREAKPAD
    sentry_options_set_release(options, "my-project-name@2.3.12");
    sentry_options_set_debug(options, 1);
    sentry_options_set_auto_session_tracking(options, 1);
    sentry_options_set_traces_sample_rate(options, 0.2);

    sentry_init(options);

    sentry_start_session();
    // make sure everything flushes

        dotenv::init("../../.env");
        password = dotenv::getenv("PASSWORD");
        public_key = loadKey(dotenv::getenv("PUBLIC_KEY"));
        private_key = loadKey(dotenv::getenv("PRIVATE_KEY"));

        SimpleApp app;
        set_global_base(dotenv::getenv("TEMPLATES"));

        addWebRoute(app);
        addApiRoute(app);

        app.port(18080).multithreaded().run();
    sentry_end_session();
}
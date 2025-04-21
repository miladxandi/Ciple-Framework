#include "crow.h"
#include "Config/Auth.h"
#include "Helpers/Fs/Reader.h"
#include "Routes/Web.h"
#include "Routes/Api.h"
#include "Helpers/Fs/Dotenv.h"
#include "include/sentry.h"

int main() {
    // Initialize Sentry
    sentry_options_t *options = sentry_options_new();
    sentry_options_set_dsn(options, "YOUR_DSN_HERE");
    sentry_options_set_database_path(options, ".sentry-native");
    sentry_options_set_release(options, "my-project-name@2.3.12");
    sentry_options_set_handler_path(options, "bin/crashpad_handler");
    sentry_options_set_debug(options, 1);
    sentry_init(options);

    // Send test event
    sentry_capture_event(sentry_value_new_message_event(
            SENTRY_LEVEL_INFO,
            "custom",
            "It works!"
    ));

    // Load environment variables
    dotenv::init("../.env");
    std::string password = dotenv::getenv("PASSWORD");
    // فرض میکنیم loadKey توابع مناسب برای بارگذاری کلیدها هستند
    auto public_key = loadKey(dotenv::getenv("PUBLIC_KEY"));
    auto private_key = loadKey(dotenv::getenv("PRIVATE_KEY"));

    // Setup Crow app
    SimpleApp app;
    set_global_base(dotenv::getenv("TEMPLATES"));

    // Add routes
    addWebRoute(app);
    addApiRoute(app);

    // Run app
    app.port(18080).run();

    // Cleanup Sentry AFTER app finishes
    sentry_close();
}
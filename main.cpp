#include "crow.h"
#include "Config/Auth.h"
#include "Helpers/Fs/Reader.h"
#include "Routes/Web.h"
#include "Routes/Api.h"
#include "Helpers/Fs/Dotenv.h"
int main() {

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

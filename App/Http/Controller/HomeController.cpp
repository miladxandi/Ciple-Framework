#include "HomeController.h"
#include <crow/mustache.h> // در صورت نیاز
using namespace std;
using namespace crow::mustache;
namespace App::Http::Controller {
    string HomeController::index() {
        auto page = load_text("index.html"); // فرض شده که `load_text` وجود دارد
        return page;
    }

    rendered_template HomeController::page(string name) {
        auto page = load("variable.html");
        context ctx({{"person", name}});
        return page.render(ctx);
    }
}
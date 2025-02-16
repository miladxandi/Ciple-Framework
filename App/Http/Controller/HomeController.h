//
// Created by APPLE on 15/02/2025.
//

#ifndef HOMECONTROLLER_H
#define HOMECONTROLLER_H
#include "crow.h"
using namespace std;


using namespace crow::mustache;
inline string index() {
    auto page = load_text("index.html");
    return page;
}

inline rendered_template page(string name) {
    auto page = load("variable.html"); //
    context ctx ({{"person", name}}); //
    return page.render(ctx); //
}


#endif //HOMECONTROLLER_H

//
// Created by istock on 26/04/2025.
//
#pragma once
#include <string>
#include "crow.h"
#include "nlohmann/json.hpp"
using namespace std;
using namespace crow::json;
using njson = nlohmann::json;
inline static string Generate(const auto &data,const string &source,const int &errorCode=0,const string &errorMessage="" ){
    njson x;
    x["provider"]["website"] = "https://slvrgame.com";
    x["provider"]["source"] = source;
    x["status"] = errorCode==0;
    x["error"]["code"] = errorCode;
    x["error"]["message"] = errorMessage;
    try {
        njson parsed_data = njson::parse(data);
        x["data"] = parsed_data;
    } catch (const njson::exception& e) {
        x["data"] = {};
        x["error"]["code"] = 168;
        x["error"]["message"] = errorMessage.empty() ? string("Failed to parse data: ") + e.what() : errorMessage;
        x["status"] = false;
    }
    return to_string(x);
}
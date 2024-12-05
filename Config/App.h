//
// Created by APPLE on 04/12/2024.
//

#ifndef APP_H
#define APP_H

#include "iostream"
#include "../Helpers/Fs/Dotenv.h"

using namespace std;

inline string issuer = dotenv::getenv("ISSUER");
inline string domain = dotenv::getenv("DOMAIN");

#endif //APP_H

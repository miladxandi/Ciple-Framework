//
// Created by APPLE on 04/12/2024.
//

#ifndef JWTHELPERS_H
#define JWTHELPERS_H

#include <iostream>
#include <jwt-cpp/jwt.h>
#include <jwt-cpp/traits/nlohmann-json/traits.h>
#include "../../Config/App.h"
#include "../../Config/Auth.h"
using namespace std;

inline string encoder(const string &user_id, const string &claimer, const vector<string>  &claimers) {

    const auto time = jwt::date::clock::now();
    const auto token = jwt::create<jwt::traits::nlohmann_json>()
                   .set_type("JWT")
                   .set_issuer(issuer)
                   .set_subject(user_id)
                   .set_payload_claim(claimer,jwt::basic_claim<jwt::traits::nlohmann_json>(claimers.begin(),claimers.end()))
                   .set_audience(domain)
                   .set_issued_at(time)
                   .set_not_before(time)
                   .set_expires_at(time + std::chrono::months{6})
                   .sign(jwt::algorithm::ed25519{
                       public_key,
                       private_key,
                       password,
                       password
                   });
    return token;
}

inline jwt::decoded_jwt<jwt::traits::nlohmann_json> decoder(const string &jwt) {
    auto decoded = jwt::decode<jwt::traits::nlohmann_json>(jwt);
    return decoded;
}

#endif //JWTHELPERS_H

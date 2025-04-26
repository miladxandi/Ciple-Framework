//
// Created by APPLE on 24/04/2025.
//

#include "ContentApiController.h"
#include "crow.h"
#include "../../../Helpers/Encodings/Cryption.hpp"
#include "../../../Helpers/Auth/JwtHelpers.h"
#include "../../../Helpers/Encodings/JsonGenerator.hpp"
#include <sentry.h>
#include "nlohmann/json.hpp"
namespace App::Http::Controller {
    response ContentApiController::index(const request &req) {
        try{
            if (req.get_header_value("Authorization").empty())
                throw "Authentication header not provided";

            auto authorizationToken = req.get_header_value("Authorization").substr(7);
            auto decoded = decoder(authorizationToken);
            if (decoded.get_payload().contains("read:contents")){
                try{

                    // داده‌های ورودی
                    string ciphertext_b64 = "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";
                    string key_b64 = "2o5bIXddqCWUYP6PanCymeRQBUWhwQeCyqO9EVwtINQ=";
                    string iv_b64 = "TwvphC/n+Ys4KqlGrugyiw==";

                    // دی‌کد کردن Base64
                    auto ciphertext = base64_decode(ciphertext_b64);
                    auto key = base64_decode(key_b64);
                    auto iv = base64_decode(iv_b64);

                    // بررسی اندازه‌های ورودی
                    if (key.size() != 32) {
                        throw  "اندازه کلید باید 32 بایت (AES-256) باشد!";
                    }
                    if (iv.size() != 16) {
                        throw  "اندازه IV باید 16 بایت باشد!";
                    }

                    // رمزگشایی
//            auto plaintext = aes_decrypt(ciphertext, key, iv);
                    auto plaintext = "{\"Movies\":[{\"Id\":\"45d7f713-4fc7-49c9-822b-7793e48a72f\",\"EnglishName\":\"Sample\",\"ArabicName\":\"u0645u062bu0627u0644\",\"Url\":\"https://my.slvrgame.com/storage/videos/4EgamnMF1uoYgd2AhUyH3yL23mvihvcXuabBNqS9.mp4\",\"Cost\":100,\"Tags\":[],\"Posters\":[{\"id\":\"db2b8c29-235c-415b-9205-31bf946ba439\",\"language\":\"en\",\"type\":\"image\",\"Age\":null,\"Url\":\"https://my.slvrgame.com/storage/contents/StcVgzymd2Cq3kwnqYMplR5E6by9xLWAqgbrfYZY.jpg\"},{\"id\":\"5df2b608-10bd-4ca1-9ebf-20e9a3695d5f\",\"language\":\"ar\",\"type\":\"image\",\"Age\":null,\"Url\":\"https://my.slvrgame.com/storage/contents/oLsHpKZkVoHOsaBOpVZxSSveW63rSiFlhdxum26o.jpg\"}]},{\"Id\":\"5a5e6005-ebc8-4da8-a883-6340145edf9c\",\"EnglishName\":\"Mercy for Mankind\",\"ArabicName\":\"u0627u0644u0631u062du0645u0629 u0644u0644u0625u0646u0633u0627u0646u06ccu0629\",\"Url\":\"https://my.slvrgame.com/storage/videos/XjKowSVjMmFjigQkN7N53wLijjE18UQou2a9RAC9.mp4\",\"Cost\":0,\"Tags\":[],\"Posters\":[{\"id\":\"032052cf-1620-4ca1-9d9f-47b288a182f6\",\"language\":\"en\",\"type\":\"\",\"Url\":\"https://my.slvrgame.com/storage/contents/RFRlrRZCJQW61sslTLUIckVpsObUx9pGMAgOWGL1.jpg\"},{\"id\":\"76110888-8d3a-4024-92a4-59441ab52c80\",\"language\":\"ar\",\"type\":\"image\",\"Age\":null,\"Url\":\"https://my.slvrgame.com/storage/contents/Ne6Wb8tbeGnf5OLcgNbEV27sAPIgmZQj1SCQS8xc.jpg\"}]},{\"Id\":\"e2f9f216-6310-4fc6-87f5-d8011d446a09\",\"EnglishName\":\"Salo\",\"ArabicName\":\"u0635u0644u0648u0627\",\"Url\":\"https://my.slvrgame.com/storage/videos/IjG38HLwUEjyDuVIya13BanGkHjNTkw4oiIjoGKp.mp4\",\"Cost\":0,\"Tags\":[],\"Posters\":[{\"id\":\"2aaa884f-6ae1-4144-bfd3-00a929242a7f\",\"language\":\"en\",\"type\":\"image\",\"Age\":null,\"Url\":\"https://my.slvrgame.com/storage/contents/RRs75VRmEMo3FyTTnvFwnBCRyLWKyWXlANpq8gsg.jpg\"},{\"id\":\"ecb1d0cb-2759-48a9-b4a6-f08260e6a7ae\",\"language\":\"ar\",\"type\":\"image\",\"Age\":null,\"Url\":\"https://my.slvrgame.com/storage/contents/fI36MNYG6VtoedEw6SU41Q7mg1oBvi6ZfG80k19O.jpg\"}]},{\"Id\":\"ea7cbc97-aac0-448f-9c25-e6d658915539\",\"EnglishName\":\"Nashidat Qoraysh\",\"ArabicName\":\"u0646u0634u064au062fu0629 u0642u0631u064au0634\",\"Url\":\"https://my.slvrgame.com/storage/videos/oU9BnmGaEuz9OB05EQalvrM8wy28lFIiD6XQph3v.mp4\",\"Cost\":0,\"Tags\":[{\"identifier\":\"anashid\",\"englishTitle\":\"Anashid\",\"arabicTitle\":\"u0623u0646u0627u0634u06ccu062f\"}],\"Posters\":[{\"id\":\"dcaa91b4-bd24-4ec9-b712-678fa19ec318\",\"language\":\"en\",\"type\":\"image\",\"Age\":null,\"Url\":\"https://my.slvrgame.com/storage/contents/68wa3mL859rkAHihCwd6CruwD0Rz78BpYLsk6Uk9.jpg\"},{\"id\":\"35ad7445-3060-4207-acdc-45d454c61f5e\",\"language\":\"ar\",\"type\":\"image\",\"Age\":null,\"Url\":\"https://my.slvrgame.com/storage/contents/VndrxP1l1GTWc5xZhdWFeSO6umKVN0LGuXFYbkuc.jpg\"}]},{\"Id\":\"f8b66e70-678e-4749-9fa3-1d1ce39797a1\",\"EnglishName\":\"Ashura\",\"ArabicName\":\"u0645u0646 u0648u062du064a u0639u0627u0634u0648u0631u0627u0621\",\"Url\":\"https://my.slvrgame.com/storage/videos/5v3odoJD9i4TS09siDAKCkKC8l23pbYThQWTvtHE.mp4\",\"Cost\":0,\"Tags\":[{\"identifier\":\"animation\",\"englishTitle\":\"Animation\",\"arabicTitle\":\"u0627u0644u0627u0646u06ccu0645u06ccu0634u0646\"},{\"identifier\":\"serial\",\"englishTitle\":\"Serial\",\"arabicTitle\":\"u0627u0644u0633u0631u06ccu0627u0644\"}],\"Posters\":[{\"id\":\"4c91aae7-cbf6-4f2f-9f78-3c463f610402\",\"language\":\"en\",\"type\":\"image\",\"Age\":null,\"Url\":\"https://my.slvrgame.com/storage/contents/tE3vv0XSTMeTz4lCHDXD7fD6rWRRqlJbh5C53ZMW.jpg\"},{\"id\":\"9f8296f3-40ee-4506-be96-254179d7f188\",\"language\":\"ar\",\"type\":\"image\",\"Age\":null,\"Url\":\"https://my.slvrgame.com/storage/contents/e0NtuQtgNQ5mqCyFJMmirO2vjwvIyNC1jK9OEbE4.jpg\"}]}]}";//aes_decrypt(ciphertext, key, iv);

                    // چاپ متن دی‌کد شده
//            string plaintext_str(plaintext.begin(), plaintext.end());
                    return response(200,"application/json",Generate(plaintext,"Content API"));
                }
                catch(const char *message){
                    sentry_capture_event(sentry_value_new_message_event(
                            /*   level */ SENTRY_LEVEL_ERROR,
                            /*  logger */ "custom",
                            /* message */ message
                    ));
                    return response(200,"application/json",Generate("","Content API",500,message));
                }
                catch(...){
                    sentry_capture_event(sentry_value_new_message_event(
                            /*   level */ SENTRY_LEVEL_ERROR,
                            /*  logger */ "custom",
                            /* message */ "Unhandled exception"
                    ));
                    return response(500,"application/json",Generate("","Content API",500,"Unhandled exception"));
                }
            }
            else{
                return response(401,"application/json",Generate("","Content API",401,"Unauthorized"));
            }
        }
        catch(const char *message){
            return response(401,"application/json",Generate("","Content API",401,message));
        }
        catch(...){
            sentry_capture_event(sentry_value_new_message_event(
                    /*   level */ SENTRY_LEVEL_ERROR,
                    /*  logger */ "custom",
                    /* message */ "Authentication exception"
            ));
            return response(401,"application/json",Generate("","Content API",401,"Authentication exception"));
        }
    }
}
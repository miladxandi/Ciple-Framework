//
// Created by istock on 26/04/2025.
//

#pragma once
#include <iostream>
#include <string>
#include <vector>
#include <openssl/evp.h>
#include <openssl/aes.h>
#include <openssl/bio.h>
#include <openssl/buffer.h>
#include <nlohmann/json.hpp>

using namespace std;
using njson = nlohmann::json;

// تابع برای دیکد کردن Base64
vector<unsigned char> base64_decode(const string& input) {
    BIO *bio, *b64;
    vector<unsigned char> buffer(input.size());

    bio = BIO_new_mem_buf(input.data(), input.size());
    b64 = BIO_new(BIO_f_base64());
    bio = BIO_push(b64, bio);

    BIO_set_flags(bio, BIO_FLAGS_BASE64_NO_NL);
    int decoded_size = BIO_read(bio, buffer.data(), input.size());
    buffer.resize(decoded_size);

    BIO_free_all(bio);
    return buffer;
}

// تابع برای رمزگشایی AES
string aes_decrypt(const vector<unsigned char>& ciphertext,
                   const vector<unsigned char>& key,
                   const vector<unsigned char>& iv) {
    EVP_CIPHER_CTX *ctx = EVP_CIPHER_CTX_new();
    if (!ctx) {
        throw runtime_error("Failed to create EVP_CIPHER_CTX");
    }

    // تنظیمات رمزگشایی AES-256-CBC
    if (EVP_DecryptInit_ex(ctx, EVP_aes_256_cbc(), nullptr, key.data(), iv.data()) != 1) {
        EVP_CIPHER_CTX_free(ctx);
        throw runtime_error("EVP_DecryptInit_ex failed");
    }

    vector<unsigned char> plaintext(ciphertext.size() + AES_BLOCK_SIZE);
    int len;

    // رمزگشایی
    if (EVP_DecryptUpdate(ctx, plaintext.data(), &len, ciphertext.data(), ciphertext.size()) != 1) {
        EVP_CIPHER_CTX_free(ctx);
        throw runtime_error("EVP_DecryptUpdate failed");
    }
    int plaintext_len = len;

    // نهایی Risk Warning: نهایی‌سازی رمزگشایی
    if (EVP_DecryptFinal_ex(ctx, plaintext.data() + len, &len) != 1) {
        EVP_CIPHER_CTX_free(ctx);
        throw runtime_error("EVP_DecryptFinal_ex failed");
    }
    plaintext_len += len;

    EVP_CIPHER_CTX_free(ctx);

    // تبدیل به رشته
    return string(plaintext.begin(), plaintext.begin() + plaintext_len);
}

// تابع برای پاکسازی کاراکترهای غیر UTF-8
string clean_json_string(const string& input) {
    string output;
    output.reserve(input.size());
    for (size_t i = 0; i < input.size(); ++i) {
        unsigned char c = input[i];
        if (c < 128 || (c >= 192 && c < 254)) {
            output += c;
        } else {
            output += '?';
        }
    }
    return output;
}

//
// Created by APPLE on 04/12/2024.
//

#ifndef READER_H
#define READER_H


#include "iostream"
#include <fstream>
#include <sstream>
using namespace std;

inline string loadFile(const string &filePath) {
    // Open the file
    ifstream loadedFile(filesystem::current_path().string()+"/"+filePath, std::ios::in);
    if (!loadedFile.is_open()) {
        throw std::runtime_error("Failed to open key file: " + filesystem::current_path().string()+"/"+filePath);
    }

    // Read the file content into a string
    stringstream buffer;
    buffer << loadedFile.rdbuf();
    loadedFile.close();

    return buffer.str();
}

inline string loadKey(const string &filePath) {
    // Open the file
    ifstream loadedFile(filePath, std::ios::in);
    if (!loadedFile.is_open()) {
        throw std::runtime_error("Failed to open key file: "+filePath);
    }

    // Read the file content into a string
    stringstream buffer;
    buffer << loadedFile.rdbuf();
    loadedFile.close();

    return buffer.str();
}



#endif //READER_H

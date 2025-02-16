//
// Created by APPLE on 04/12/2024.
//

#ifndef READER_H
#define READER_H


#include "iostream"
#include <fstream>
#include <sstream>
using namespace std;
using namespace filesystem;
inline string loadFile(const string &filePath) {
    // Open the file
    ifstream loadedFile(current_path().string()+"/"+filePath, ios::in);
    if (!loadedFile.is_open()) {
        throw std::runtime_error("Failed to open the file: " + current_path().string()+"/"+filePath);
    }

    // Read the file content into a string
    stringstream buffer;
    buffer << loadedFile.rdbuf();
    loadedFile.close();

    return buffer.str();
}

inline string loadKey(const string &filePath) {
    // Open the file
    ifstream loadedFile(filePath, ios::in);
    if (!loadedFile.is_open()) {
        throw std::runtime_error("Failed to open the key file: "+filePath);
    }

    // Read the file content into a string
    stringstream buffer;
    buffer << loadedFile.rdbuf();
    loadedFile.close();

    return buffer.str();
}



#endif //READER_H

cmake_minimum_required(VERSION 3.29)
project(Ciple-Framework)
set(RESOURCE_DIR ${CMAKE_SOURCE_DIR}/Resources) # Source directory
set(OUTPUT_DIR ${CMAKE_BINARY_DIR}/Resources
        add_custom_command(
        TARGET SLVR_Server POST_BUILD
        COMMAND ${CMAKE_COMMAND} -E copy_directory
        ${RESOURCE_DIR} ${OUTPUT_DIR}
        COMMENT "Copying resources to output directory..."
))   # Destination directory
set(CMAKE_CXX_STANDARD 23)
find_package(Crow REQUIRED)
find_package(jwt-cpp REQUIRED)
find_package(nlohmann_json REQUIRED)
find_package(cxxopts REQUIRED)

add_executable(Ciple-Framework main.cpp
        Helpers/Auth/JwtHelpers.h
        Helpers/Fs/Reader.h
        Config/App.h
        Config/Auth.h
        Helpers/Fs/Dotenv.h
        Routes/Web.h
        Routes/Api.h
        App/Http/Controller/HomeController.h
)

target_link_libraries(Ciple-Framework Crow::Crow jwt-cpp::jwt-cpp nlohmann_json::nlohmann_json cxxopts::cxxopts)

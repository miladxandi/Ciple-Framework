cmake_minimum_required(VERSION 3.25)
project(Ciple-Framework)

set(CMAKE_CXX_STANDARD 23)
#set(CMAKE_CXX_STANDARD_REQUIRED ON)
#set(CMAKE_CXX_EXTENSIONS OFF)
## تنظیم مسیرهای include و lib
#include_directories(${CMAKE_SOURCE_DIR}/include ${CMAKE_SOURCE_DIR})
#link_directories(${CMAKE_SOURCE_DIR}/lib)
#
## یافتن کتابخانه Sentry
#find_library(SENTRY_LIB sentry PATHS ${CMAKE_SOURCE_DIR}/lib NO_DEFAULT_PATH)
#if(NOT SENTRY_LIB)
#    message(FATAL_ERROR "Sentry library not found in ${CMAKE_SOURCE_DIR}/lib")
#endif()

# یافتن پکیج‌های مورد نیاز
find_package(sentry REQUIRED)
find_package(Crow REQUIRED)
find_package(jwt-cpp REQUIRED)
find_package(nlohmann_json REQUIRED)
find_package(cxxopts REQUIRED)

# جمع‌آوری فایل‌های منبع (.cpp) و هدر (.h) از پوشه‌های پروژه
file(GLOB SOURCES
        ${CMAKE_SOURCE_DIR}/*.cpp
        ${CMAKE_SOURCE_DIR}/App/*.cpp
        ${CMAKE_SOURCE_DIR}/App/Http/*.cpp
        ${CMAKE_SOURCE_DIR}/App/Http/Controller/*.cpp
        ${CMAKE_SOURCE_DIR}/Helpers/*.cpp
        ${CMAKE_SOURCE_DIR}/Config/*.cpp
        ${CMAKE_SOURCE_DIR}/Routes/*.cpp
)
file(GLOB HEADERS
        ${CMAKE_SOURCE_DIR}/*.h
        ${CMAKE_SOURCE_DIR}/App/*.h
        ${CMAKE_SOURCE_DIR}/App/Http/*.h
        ${CMAKE_SOURCE_DIR}/App/Http/Controller/*.h
        ${CMAKE_SOURCE_DIR}/Helpers/*.h
        ${CMAKE_SOURCE_DIR}/Config/*.h
        ${CMAKE_SOURCE_DIR}/Routes/*.h
        ${CMAKE_SOURCE_DIR}/include/*.h
)

# بررسی فایل‌های جمع‌آوری‌شده
message("Sources: ${SOURCES}")
message("Headers: ${HEADERS}")

# تعریف هدف اجرایی
add_executable(Ciple-Framework ${SOURCES} ${HEADERS})

# لینک کردن کتابخانه‌ها
target_link_libraries(Ciple-Framework
        sentry-native::sentry-native
        Crow::Crow
        jwt-cpp::jwt-cpp
        nlohmann_json::nlohmann_json
        cxxopts::cxxopts
)


# کپی منابع به پوشه خروجی
set(RESOURCE_DIR ${CMAKE_SOURCE_DIR}/Resources)
set(OUTPUT_DIR ${CMAKE_BINARY_DIR}/Resources)
if(EXISTS ${RESOURCE_DIR})
    add_custom_command(TARGET Ciple-Framework POST_BUILD
            COMMAND ${CMAKE_COMMAND} -E copy_directory
            ${RESOURCE_DIR} ${OUTPUT_DIR}
            COMMENT "Copying resources to ${OUTPUT_DIR}..."
    )
endif()
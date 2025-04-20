message(STATUS "Conan: Using CMakeDeps conandeps_legacy.cmake aggregator via include()")
message(STATUS "Conan: It is recommended to use explicit find_package() per dependency instead")

find_package(cxxopts)
find_package(nlohmann_json)
find_package(Crow)
find_package(jwt-cpp)

set(CONANDEPS_LEGACY  cxxopts::cxxopts  nlohmann_json::nlohmann_json  Crow::Crow  jwt-cpp::jwt-cpp )
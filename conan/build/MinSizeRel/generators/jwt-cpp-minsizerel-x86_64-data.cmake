########### AGGREGATED COMPONENTS AND DEPENDENCIES FOR THE MULTI CONFIG #####################
#############################################################################################

set(jwt-cpp_COMPONENT_NAMES "")
if(DEFINED jwt-cpp_FIND_DEPENDENCY_NAMES)
  list(APPEND jwt-cpp_FIND_DEPENDENCY_NAMES OpenSSL)
  list(REMOVE_DUPLICATES jwt-cpp_FIND_DEPENDENCY_NAMES)
else()
  set(jwt-cpp_FIND_DEPENDENCY_NAMES OpenSSL)
endif()
set(OpenSSL_FIND_MODE "NO_MODULE")

########### VARIABLES #######################################################################
#############################################################################################
set(jwt-cpp_PACKAGE_FOLDER_MINSIZEREL "/home/miladxandi/.conan2/p/jwt-cc62de6eb33ddf/p")
set(jwt-cpp_BUILD_MODULES_PATHS_MINSIZEREL )


set(jwt-cpp_INCLUDE_DIRS_MINSIZEREL "${jwt-cpp_PACKAGE_FOLDER_MINSIZEREL}/include")
set(jwt-cpp_RES_DIRS_MINSIZEREL )
set(jwt-cpp_DEFINITIONS_MINSIZEREL "-DJWT_DISABLE_PICOJSON")
set(jwt-cpp_SHARED_LINK_FLAGS_MINSIZEREL )
set(jwt-cpp_EXE_LINK_FLAGS_MINSIZEREL )
set(jwt-cpp_OBJECTS_MINSIZEREL )
set(jwt-cpp_COMPILE_DEFINITIONS_MINSIZEREL "JWT_DISABLE_PICOJSON")
set(jwt-cpp_COMPILE_OPTIONS_C_MINSIZEREL )
set(jwt-cpp_COMPILE_OPTIONS_CXX_MINSIZEREL )
set(jwt-cpp_LIB_DIRS_MINSIZEREL )
set(jwt-cpp_BIN_DIRS_MINSIZEREL )
set(jwt-cpp_LIBRARY_TYPE_MINSIZEREL UNKNOWN)
set(jwt-cpp_IS_HOST_WINDOWS_MINSIZEREL 0)
set(jwt-cpp_LIBS_MINSIZEREL )
set(jwt-cpp_SYSTEM_LIBS_MINSIZEREL )
set(jwt-cpp_FRAMEWORK_DIRS_MINSIZEREL )
set(jwt-cpp_FRAMEWORKS_MINSIZEREL )
set(jwt-cpp_BUILD_DIRS_MINSIZEREL )
set(jwt-cpp_NO_SONAME_MODE_MINSIZEREL FALSE)


# COMPOUND VARIABLES
set(jwt-cpp_COMPILE_OPTIONS_MINSIZEREL
    "$<$<COMPILE_LANGUAGE:CXX>:${jwt-cpp_COMPILE_OPTIONS_CXX_MINSIZEREL}>"
    "$<$<COMPILE_LANGUAGE:C>:${jwt-cpp_COMPILE_OPTIONS_C_MINSIZEREL}>")
set(jwt-cpp_LINKER_FLAGS_MINSIZEREL
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${jwt-cpp_SHARED_LINK_FLAGS_MINSIZEREL}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${jwt-cpp_SHARED_LINK_FLAGS_MINSIZEREL}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${jwt-cpp_EXE_LINK_FLAGS_MINSIZEREL}>")


set(jwt-cpp_COMPONENTS_MINSIZEREL )
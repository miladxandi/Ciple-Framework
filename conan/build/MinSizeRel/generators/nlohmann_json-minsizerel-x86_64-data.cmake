########### AGGREGATED COMPONENTS AND DEPENDENCIES FOR THE MULTI CONFIG #####################
#############################################################################################

set(nlohmann_json_COMPONENT_NAMES "")
if(DEFINED nlohmann_json_FIND_DEPENDENCY_NAMES)
  list(APPEND nlohmann_json_FIND_DEPENDENCY_NAMES )
  list(REMOVE_DUPLICATES nlohmann_json_FIND_DEPENDENCY_NAMES)
else()
  set(nlohmann_json_FIND_DEPENDENCY_NAMES )
endif()

########### VARIABLES #######################################################################
#############################################################################################
set(nlohmann_json_PACKAGE_FOLDER_MINSIZEREL "/home/miladxandi/.conan2/p/nlohm0567ffc90cfc1/p")
set(nlohmann_json_BUILD_MODULES_PATHS_MINSIZEREL )


set(nlohmann_json_INCLUDE_DIRS_MINSIZEREL "${nlohmann_json_PACKAGE_FOLDER_MINSIZEREL}/include")
set(nlohmann_json_RES_DIRS_MINSIZEREL )
set(nlohmann_json_DEFINITIONS_MINSIZEREL )
set(nlohmann_json_SHARED_LINK_FLAGS_MINSIZEREL )
set(nlohmann_json_EXE_LINK_FLAGS_MINSIZEREL )
set(nlohmann_json_OBJECTS_MINSIZEREL )
set(nlohmann_json_COMPILE_DEFINITIONS_MINSIZEREL )
set(nlohmann_json_COMPILE_OPTIONS_C_MINSIZEREL )
set(nlohmann_json_COMPILE_OPTIONS_CXX_MINSIZEREL )
set(nlohmann_json_LIB_DIRS_MINSIZEREL )
set(nlohmann_json_BIN_DIRS_MINSIZEREL )
set(nlohmann_json_LIBRARY_TYPE_MINSIZEREL UNKNOWN)
set(nlohmann_json_IS_HOST_WINDOWS_MINSIZEREL 0)
set(nlohmann_json_LIBS_MINSIZEREL )
set(nlohmann_json_SYSTEM_LIBS_MINSIZEREL )
set(nlohmann_json_FRAMEWORK_DIRS_MINSIZEREL )
set(nlohmann_json_FRAMEWORKS_MINSIZEREL )
set(nlohmann_json_BUILD_DIRS_MINSIZEREL )
set(nlohmann_json_NO_SONAME_MODE_MINSIZEREL FALSE)


# COMPOUND VARIABLES
set(nlohmann_json_COMPILE_OPTIONS_MINSIZEREL
    "$<$<COMPILE_LANGUAGE:CXX>:${nlohmann_json_COMPILE_OPTIONS_CXX_MINSIZEREL}>"
    "$<$<COMPILE_LANGUAGE:C>:${nlohmann_json_COMPILE_OPTIONS_C_MINSIZEREL}>")
set(nlohmann_json_LINKER_FLAGS_MINSIZEREL
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${nlohmann_json_SHARED_LINK_FLAGS_MINSIZEREL}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${nlohmann_json_SHARED_LINK_FLAGS_MINSIZEREL}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${nlohmann_json_EXE_LINK_FLAGS_MINSIZEREL}>")


set(nlohmann_json_COMPONENTS_MINSIZEREL )
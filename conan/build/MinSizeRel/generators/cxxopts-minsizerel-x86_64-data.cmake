########### AGGREGATED COMPONENTS AND DEPENDENCIES FOR THE MULTI CONFIG #####################
#############################################################################################

set(cxxopts_COMPONENT_NAMES "")
if(DEFINED cxxopts_FIND_DEPENDENCY_NAMES)
  list(APPEND cxxopts_FIND_DEPENDENCY_NAMES )
  list(REMOVE_DUPLICATES cxxopts_FIND_DEPENDENCY_NAMES)
else()
  set(cxxopts_FIND_DEPENDENCY_NAMES )
endif()

########### VARIABLES #######################################################################
#############################################################################################
set(cxxopts_PACKAGE_FOLDER_MINSIZEREL "/home/miladxandi/.conan2/p/cxxop782c19b5a4d3b/p")
set(cxxopts_BUILD_MODULES_PATHS_MINSIZEREL )


set(cxxopts_INCLUDE_DIRS_MINSIZEREL "${cxxopts_PACKAGE_FOLDER_MINSIZEREL}/include")
set(cxxopts_RES_DIRS_MINSIZEREL )
set(cxxopts_DEFINITIONS_MINSIZEREL )
set(cxxopts_SHARED_LINK_FLAGS_MINSIZEREL )
set(cxxopts_EXE_LINK_FLAGS_MINSIZEREL )
set(cxxopts_OBJECTS_MINSIZEREL )
set(cxxopts_COMPILE_DEFINITIONS_MINSIZEREL )
set(cxxopts_COMPILE_OPTIONS_C_MINSIZEREL )
set(cxxopts_COMPILE_OPTIONS_CXX_MINSIZEREL )
set(cxxopts_LIB_DIRS_MINSIZEREL )
set(cxxopts_BIN_DIRS_MINSIZEREL )
set(cxxopts_LIBRARY_TYPE_MINSIZEREL UNKNOWN)
set(cxxopts_IS_HOST_WINDOWS_MINSIZEREL 0)
set(cxxopts_LIBS_MINSIZEREL )
set(cxxopts_SYSTEM_LIBS_MINSIZEREL )
set(cxxopts_FRAMEWORK_DIRS_MINSIZEREL )
set(cxxopts_FRAMEWORKS_MINSIZEREL )
set(cxxopts_BUILD_DIRS_MINSIZEREL )
set(cxxopts_NO_SONAME_MODE_MINSIZEREL FALSE)


# COMPOUND VARIABLES
set(cxxopts_COMPILE_OPTIONS_MINSIZEREL
    "$<$<COMPILE_LANGUAGE:CXX>:${cxxopts_COMPILE_OPTIONS_CXX_MINSIZEREL}>"
    "$<$<COMPILE_LANGUAGE:C>:${cxxopts_COMPILE_OPTIONS_C_MINSIZEREL}>")
set(cxxopts_LINKER_FLAGS_MINSIZEREL
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${cxxopts_SHARED_LINK_FLAGS_MINSIZEREL}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${cxxopts_SHARED_LINK_FLAGS_MINSIZEREL}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${cxxopts_EXE_LINK_FLAGS_MINSIZEREL}>")


set(cxxopts_COMPONENTS_MINSIZEREL )
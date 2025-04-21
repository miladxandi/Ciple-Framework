########### AGGREGATED COMPONENTS AND DEPENDENCIES FOR THE MULTI CONFIG #####################
#############################################################################################

set(crowcpp-crow_COMPONENT_NAMES "")
if(DEFINED crowcpp-crow_FIND_DEPENDENCY_NAMES)
  list(APPEND crowcpp-crow_FIND_DEPENDENCY_NAMES asio)
  list(REMOVE_DUPLICATES crowcpp-crow_FIND_DEPENDENCY_NAMES)
else()
  set(crowcpp-crow_FIND_DEPENDENCY_NAMES asio)
endif()
set(asio_FIND_MODE "NO_MODULE")

########### VARIABLES #######################################################################
#############################################################################################
set(crowcpp-crow_PACKAGE_FOLDER_MINSIZEREL "/home/miladxandi/.conan2/p/crowc9fea44d7b7fb7/p")
set(crowcpp-crow_BUILD_MODULES_PATHS_MINSIZEREL )


set(crowcpp-crow_INCLUDE_DIRS_MINSIZEREL "${crowcpp-crow_PACKAGE_FOLDER_MINSIZEREL}/include")
set(crowcpp-crow_RES_DIRS_MINSIZEREL )
set(crowcpp-crow_DEFINITIONS_MINSIZEREL )
set(crowcpp-crow_SHARED_LINK_FLAGS_MINSIZEREL )
set(crowcpp-crow_EXE_LINK_FLAGS_MINSIZEREL )
set(crowcpp-crow_OBJECTS_MINSIZEREL )
set(crowcpp-crow_COMPILE_DEFINITIONS_MINSIZEREL )
set(crowcpp-crow_COMPILE_OPTIONS_C_MINSIZEREL )
set(crowcpp-crow_COMPILE_OPTIONS_CXX_MINSIZEREL )
set(crowcpp-crow_LIB_DIRS_MINSIZEREL )
set(crowcpp-crow_BIN_DIRS_MINSIZEREL )
set(crowcpp-crow_LIBRARY_TYPE_MINSIZEREL UNKNOWN)
set(crowcpp-crow_IS_HOST_WINDOWS_MINSIZEREL 0)
set(crowcpp-crow_LIBS_MINSIZEREL )
set(crowcpp-crow_SYSTEM_LIBS_MINSIZEREL pthread)
set(crowcpp-crow_FRAMEWORK_DIRS_MINSIZEREL )
set(crowcpp-crow_FRAMEWORKS_MINSIZEREL )
set(crowcpp-crow_BUILD_DIRS_MINSIZEREL )
set(crowcpp-crow_NO_SONAME_MODE_MINSIZEREL FALSE)


# COMPOUND VARIABLES
set(crowcpp-crow_COMPILE_OPTIONS_MINSIZEREL
    "$<$<COMPILE_LANGUAGE:CXX>:${crowcpp-crow_COMPILE_OPTIONS_CXX_MINSIZEREL}>"
    "$<$<COMPILE_LANGUAGE:C>:${crowcpp-crow_COMPILE_OPTIONS_C_MINSIZEREL}>")
set(crowcpp-crow_LINKER_FLAGS_MINSIZEREL
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${crowcpp-crow_SHARED_LINK_FLAGS_MINSIZEREL}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${crowcpp-crow_SHARED_LINK_FLAGS_MINSIZEREL}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${crowcpp-crow_EXE_LINK_FLAGS_MINSIZEREL}>")


set(crowcpp-crow_COMPONENTS_MINSIZEREL )
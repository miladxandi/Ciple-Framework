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
set(crowcpp-crow_PACKAGE_FOLDER_DEBUG "C:/Users/istock/.conan2/p/crowc9fea44d7b7fb7/p")
set(crowcpp-crow_BUILD_MODULES_PATHS_DEBUG )


set(crowcpp-crow_INCLUDE_DIRS_DEBUG "${crowcpp-crow_PACKAGE_FOLDER_DEBUG}/include")
set(crowcpp-crow_RES_DIRS_DEBUG )
set(crowcpp-crow_DEFINITIONS_DEBUG )
set(crowcpp-crow_SHARED_LINK_FLAGS_DEBUG )
set(crowcpp-crow_EXE_LINK_FLAGS_DEBUG )
set(crowcpp-crow_OBJECTS_DEBUG )
set(crowcpp-crow_COMPILE_DEFINITIONS_DEBUG )
set(crowcpp-crow_COMPILE_OPTIONS_C_DEBUG )
set(crowcpp-crow_COMPILE_OPTIONS_CXX_DEBUG )
set(crowcpp-crow_LIB_DIRS_DEBUG )
set(crowcpp-crow_BIN_DIRS_DEBUG )
set(crowcpp-crow_LIBRARY_TYPE_DEBUG UNKNOWN)
set(crowcpp-crow_IS_HOST_WINDOWS_DEBUG 1)
set(crowcpp-crow_LIBS_DEBUG )
set(crowcpp-crow_SYSTEM_LIBS_DEBUG wsock32 ws2_32)
set(crowcpp-crow_FRAMEWORK_DIRS_DEBUG )
set(crowcpp-crow_FRAMEWORKS_DEBUG )
set(crowcpp-crow_BUILD_DIRS_DEBUG )
set(crowcpp-crow_NO_SONAME_MODE_DEBUG FALSE)


# COMPOUND VARIABLES
set(crowcpp-crow_COMPILE_OPTIONS_DEBUG
    "$<$<COMPILE_LANGUAGE:CXX>:${crowcpp-crow_COMPILE_OPTIONS_CXX_DEBUG}>"
    "$<$<COMPILE_LANGUAGE:C>:${crowcpp-crow_COMPILE_OPTIONS_C_DEBUG}>")
set(crowcpp-crow_LINKER_FLAGS_DEBUG
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${crowcpp-crow_SHARED_LINK_FLAGS_DEBUG}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${crowcpp-crow_SHARED_LINK_FLAGS_DEBUG}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${crowcpp-crow_EXE_LINK_FLAGS_DEBUG}>")


set(crowcpp-crow_COMPONENTS_DEBUG )
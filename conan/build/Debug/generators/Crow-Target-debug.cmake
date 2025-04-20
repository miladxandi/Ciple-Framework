# Avoid multiple calls to find_package to append duplicated properties to the targets
include_guard()########### VARIABLES #######################################################################
#############################################################################################
set(crowcpp-crow_FRAMEWORKS_FOUND_DEBUG "") # Will be filled later
conan_find_apple_frameworks(crowcpp-crow_FRAMEWORKS_FOUND_DEBUG "${crowcpp-crow_FRAMEWORKS_DEBUG}" "${crowcpp-crow_FRAMEWORK_DIRS_DEBUG}")

set(crowcpp-crow_LIBRARIES_TARGETS "") # Will be filled later


######## Create an interface target to contain all the dependencies (frameworks, system and conan deps)
if(NOT TARGET crowcpp-crow_DEPS_TARGET)
    add_library(crowcpp-crow_DEPS_TARGET INTERFACE IMPORTED)
endif()

set_property(TARGET crowcpp-crow_DEPS_TARGET
             APPEND PROPERTY INTERFACE_LINK_LIBRARIES
             $<$<CONFIG:Debug>:${crowcpp-crow_FRAMEWORKS_FOUND_DEBUG}>
             $<$<CONFIG:Debug>:${crowcpp-crow_SYSTEM_LIBS_DEBUG}>
             $<$<CONFIG:Debug>:asio::asio>)

####### Find the libraries declared in cpp_info.libs, create an IMPORTED target for each one and link the
####### crowcpp-crow_DEPS_TARGET to all of them
conan_package_library_targets("${crowcpp-crow_LIBS_DEBUG}"    # libraries
                              "${crowcpp-crow_LIB_DIRS_DEBUG}" # package_libdir
                              "${crowcpp-crow_BIN_DIRS_DEBUG}" # package_bindir
                              "${crowcpp-crow_LIBRARY_TYPE_DEBUG}"
                              "${crowcpp-crow_IS_HOST_WINDOWS_DEBUG}"
                              crowcpp-crow_DEPS_TARGET
                              crowcpp-crow_LIBRARIES_TARGETS  # out_libraries_targets
                              "_DEBUG"
                              "crowcpp-crow"    # package_name
                              "${crowcpp-crow_NO_SONAME_MODE_DEBUG}")  # soname

# FIXME: What is the result of this for multi-config? All configs adding themselves to path?
set(CMAKE_MODULE_PATH ${crowcpp-crow_BUILD_DIRS_DEBUG} ${CMAKE_MODULE_PATH})

########## GLOBAL TARGET PROPERTIES Debug ########################################
    set_property(TARGET Crow::Crow
                 APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                 $<$<CONFIG:Debug>:${crowcpp-crow_OBJECTS_DEBUG}>
                 $<$<CONFIG:Debug>:${crowcpp-crow_LIBRARIES_TARGETS}>
                 )

    if("${crowcpp-crow_LIBS_DEBUG}" STREQUAL "")
        # If the package is not declaring any "cpp_info.libs" the package deps, system libs,
        # frameworks etc are not linked to the imported targets and we need to do it to the
        # global target
        set_property(TARGET Crow::Crow
                     APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                     crowcpp-crow_DEPS_TARGET)
    endif()

    set_property(TARGET Crow::Crow
                 APPEND PROPERTY INTERFACE_LINK_OPTIONS
                 $<$<CONFIG:Debug>:${crowcpp-crow_LINKER_FLAGS_DEBUG}>)
    set_property(TARGET Crow::Crow
                 APPEND PROPERTY INTERFACE_INCLUDE_DIRECTORIES
                 $<$<CONFIG:Debug>:${crowcpp-crow_INCLUDE_DIRS_DEBUG}>)
    # Necessary to find LINK shared libraries in Linux
    set_property(TARGET Crow::Crow
                 APPEND PROPERTY INTERFACE_LINK_DIRECTORIES
                 $<$<CONFIG:Debug>:${crowcpp-crow_LIB_DIRS_DEBUG}>)
    set_property(TARGET Crow::Crow
                 APPEND PROPERTY INTERFACE_COMPILE_DEFINITIONS
                 $<$<CONFIG:Debug>:${crowcpp-crow_COMPILE_DEFINITIONS_DEBUG}>)
    set_property(TARGET Crow::Crow
                 APPEND PROPERTY INTERFACE_COMPILE_OPTIONS
                 $<$<CONFIG:Debug>:${crowcpp-crow_COMPILE_OPTIONS_DEBUG}>)

########## For the modules (FindXXX)
set(crowcpp-crow_LIBRARIES_DEBUG Crow::Crow)

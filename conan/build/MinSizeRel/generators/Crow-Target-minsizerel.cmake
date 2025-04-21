# Avoid multiple calls to find_package to append duplicated properties to the targets
include_guard()########### VARIABLES #######################################################################
#############################################################################################
set(crowcpp-crow_FRAMEWORKS_FOUND_MINSIZEREL "") # Will be filled later
conan_find_apple_frameworks(crowcpp-crow_FRAMEWORKS_FOUND_MINSIZEREL "${crowcpp-crow_FRAMEWORKS_MINSIZEREL}" "${crowcpp-crow_FRAMEWORK_DIRS_MINSIZEREL}")

set(crowcpp-crow_LIBRARIES_TARGETS "") # Will be filled later


######## Create an interface target to contain all the dependencies (frameworks, system and conan deps)
if(NOT TARGET crowcpp-crow_DEPS_TARGET)
    add_library(crowcpp-crow_DEPS_TARGET INTERFACE IMPORTED)
endif()

set_property(TARGET crowcpp-crow_DEPS_TARGET
             APPEND PROPERTY INTERFACE_LINK_LIBRARIES
             $<$<CONFIG:MinSizeRel>:${crowcpp-crow_FRAMEWORKS_FOUND_MINSIZEREL}>
             $<$<CONFIG:MinSizeRel>:${crowcpp-crow_SYSTEM_LIBS_MINSIZEREL}>
             $<$<CONFIG:MinSizeRel>:asio::asio>)

####### Find the libraries declared in cpp_info.libs, create an IMPORTED target for each one and link the
####### crowcpp-crow_DEPS_TARGET to all of them
conan_package_library_targets("${crowcpp-crow_LIBS_MINSIZEREL}"    # libraries
                              "${crowcpp-crow_LIB_DIRS_MINSIZEREL}" # package_libdir
                              "${crowcpp-crow_BIN_DIRS_MINSIZEREL}" # package_bindir
                              "${crowcpp-crow_LIBRARY_TYPE_MINSIZEREL}"
                              "${crowcpp-crow_IS_HOST_WINDOWS_MINSIZEREL}"
                              crowcpp-crow_DEPS_TARGET
                              crowcpp-crow_LIBRARIES_TARGETS  # out_libraries_targets
                              "_MINSIZEREL"
                              "crowcpp-crow"    # package_name
                              "${crowcpp-crow_NO_SONAME_MODE_MINSIZEREL}")  # soname

# FIXME: What is the result of this for multi-config? All configs adding themselves to path?
set(CMAKE_MODULE_PATH ${crowcpp-crow_BUILD_DIRS_MINSIZEREL} ${CMAKE_MODULE_PATH})

########## GLOBAL TARGET PROPERTIES MinSizeRel ########################################
    set_property(TARGET Crow::Crow
                 APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                 $<$<CONFIG:MinSizeRel>:${crowcpp-crow_OBJECTS_MINSIZEREL}>
                 $<$<CONFIG:MinSizeRel>:${crowcpp-crow_LIBRARIES_TARGETS}>
                 )

    if("${crowcpp-crow_LIBS_MINSIZEREL}" STREQUAL "")
        # If the package is not declaring any "cpp_info.libs" the package deps, system libs,
        # frameworks etc are not linked to the imported targets and we need to do it to the
        # global target
        set_property(TARGET Crow::Crow
                     APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                     crowcpp-crow_DEPS_TARGET)
    endif()

    set_property(TARGET Crow::Crow
                 APPEND PROPERTY INTERFACE_LINK_OPTIONS
                 $<$<CONFIG:MinSizeRel>:${crowcpp-crow_LINKER_FLAGS_MINSIZEREL}>)
    set_property(TARGET Crow::Crow
                 APPEND PROPERTY INTERFACE_INCLUDE_DIRECTORIES
                 $<$<CONFIG:MinSizeRel>:${crowcpp-crow_INCLUDE_DIRS_MINSIZEREL}>)
    # Necessary to find LINK shared libraries in Linux
    set_property(TARGET Crow::Crow
                 APPEND PROPERTY INTERFACE_LINK_DIRECTORIES
                 $<$<CONFIG:MinSizeRel>:${crowcpp-crow_LIB_DIRS_MINSIZEREL}>)
    set_property(TARGET Crow::Crow
                 APPEND PROPERTY INTERFACE_COMPILE_DEFINITIONS
                 $<$<CONFIG:MinSizeRel>:${crowcpp-crow_COMPILE_DEFINITIONS_MINSIZEREL}>)
    set_property(TARGET Crow::Crow
                 APPEND PROPERTY INTERFACE_COMPILE_OPTIONS
                 $<$<CONFIG:MinSizeRel>:${crowcpp-crow_COMPILE_OPTIONS_MINSIZEREL}>)

########## For the modules (FindXXX)
set(crowcpp-crow_LIBRARIES_MINSIZEREL Crow::Crow)

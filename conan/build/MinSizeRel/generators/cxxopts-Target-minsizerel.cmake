# Avoid multiple calls to find_package to append duplicated properties to the targets
include_guard()########### VARIABLES #######################################################################
#############################################################################################
set(cxxopts_FRAMEWORKS_FOUND_MINSIZEREL "") # Will be filled later
conan_find_apple_frameworks(cxxopts_FRAMEWORKS_FOUND_MINSIZEREL "${cxxopts_FRAMEWORKS_MINSIZEREL}" "${cxxopts_FRAMEWORK_DIRS_MINSIZEREL}")

set(cxxopts_LIBRARIES_TARGETS "") # Will be filled later


######## Create an interface target to contain all the dependencies (frameworks, system and conan deps)
if(NOT TARGET cxxopts_DEPS_TARGET)
    add_library(cxxopts_DEPS_TARGET INTERFACE IMPORTED)
endif()

set_property(TARGET cxxopts_DEPS_TARGET
             APPEND PROPERTY INTERFACE_LINK_LIBRARIES
             $<$<CONFIG:MinSizeRel>:${cxxopts_FRAMEWORKS_FOUND_MINSIZEREL}>
             $<$<CONFIG:MinSizeRel>:${cxxopts_SYSTEM_LIBS_MINSIZEREL}>
             $<$<CONFIG:MinSizeRel>:>)

####### Find the libraries declared in cpp_info.libs, create an IMPORTED target for each one and link the
####### cxxopts_DEPS_TARGET to all of them
conan_package_library_targets("${cxxopts_LIBS_MINSIZEREL}"    # libraries
                              "${cxxopts_LIB_DIRS_MINSIZEREL}" # package_libdir
                              "${cxxopts_BIN_DIRS_MINSIZEREL}" # package_bindir
                              "${cxxopts_LIBRARY_TYPE_MINSIZEREL}"
                              "${cxxopts_IS_HOST_WINDOWS_MINSIZEREL}"
                              cxxopts_DEPS_TARGET
                              cxxopts_LIBRARIES_TARGETS  # out_libraries_targets
                              "_MINSIZEREL"
                              "cxxopts"    # package_name
                              "${cxxopts_NO_SONAME_MODE_MINSIZEREL}")  # soname

# FIXME: What is the result of this for multi-config? All configs adding themselves to path?
set(CMAKE_MODULE_PATH ${cxxopts_BUILD_DIRS_MINSIZEREL} ${CMAKE_MODULE_PATH})

########## GLOBAL TARGET PROPERTIES MinSizeRel ########################################
    set_property(TARGET cxxopts::cxxopts
                 APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                 $<$<CONFIG:MinSizeRel>:${cxxopts_OBJECTS_MINSIZEREL}>
                 $<$<CONFIG:MinSizeRel>:${cxxopts_LIBRARIES_TARGETS}>
                 )

    if("${cxxopts_LIBS_MINSIZEREL}" STREQUAL "")
        # If the package is not declaring any "cpp_info.libs" the package deps, system libs,
        # frameworks etc are not linked to the imported targets and we need to do it to the
        # global target
        set_property(TARGET cxxopts::cxxopts
                     APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                     cxxopts_DEPS_TARGET)
    endif()

    set_property(TARGET cxxopts::cxxopts
                 APPEND PROPERTY INTERFACE_LINK_OPTIONS
                 $<$<CONFIG:MinSizeRel>:${cxxopts_LINKER_FLAGS_MINSIZEREL}>)
    set_property(TARGET cxxopts::cxxopts
                 APPEND PROPERTY INTERFACE_INCLUDE_DIRECTORIES
                 $<$<CONFIG:MinSizeRel>:${cxxopts_INCLUDE_DIRS_MINSIZEREL}>)
    # Necessary to find LINK shared libraries in Linux
    set_property(TARGET cxxopts::cxxopts
                 APPEND PROPERTY INTERFACE_LINK_DIRECTORIES
                 $<$<CONFIG:MinSizeRel>:${cxxopts_LIB_DIRS_MINSIZEREL}>)
    set_property(TARGET cxxopts::cxxopts
                 APPEND PROPERTY INTERFACE_COMPILE_DEFINITIONS
                 $<$<CONFIG:MinSizeRel>:${cxxopts_COMPILE_DEFINITIONS_MINSIZEREL}>)
    set_property(TARGET cxxopts::cxxopts
                 APPEND PROPERTY INTERFACE_COMPILE_OPTIONS
                 $<$<CONFIG:MinSizeRel>:${cxxopts_COMPILE_OPTIONS_MINSIZEREL}>)

########## For the modules (FindXXX)
set(cxxopts_LIBRARIES_MINSIZEREL cxxopts::cxxopts)

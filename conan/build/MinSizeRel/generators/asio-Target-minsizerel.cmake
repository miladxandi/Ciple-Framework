# Avoid multiple calls to find_package to append duplicated properties to the targets
include_guard()########### VARIABLES #######################################################################
#############################################################################################
set(asio_FRAMEWORKS_FOUND_MINSIZEREL "") # Will be filled later
conan_find_apple_frameworks(asio_FRAMEWORKS_FOUND_MINSIZEREL "${asio_FRAMEWORKS_MINSIZEREL}" "${asio_FRAMEWORK_DIRS_MINSIZEREL}")

set(asio_LIBRARIES_TARGETS "") # Will be filled later


######## Create an interface target to contain all the dependencies (frameworks, system and conan deps)
if(NOT TARGET asio_DEPS_TARGET)
    add_library(asio_DEPS_TARGET INTERFACE IMPORTED)
endif()

set_property(TARGET asio_DEPS_TARGET
             APPEND PROPERTY INTERFACE_LINK_LIBRARIES
             $<$<CONFIG:MinSizeRel>:${asio_FRAMEWORKS_FOUND_MINSIZEREL}>
             $<$<CONFIG:MinSizeRel>:${asio_SYSTEM_LIBS_MINSIZEREL}>
             $<$<CONFIG:MinSizeRel>:>)

####### Find the libraries declared in cpp_info.libs, create an IMPORTED target for each one and link the
####### asio_DEPS_TARGET to all of them
conan_package_library_targets("${asio_LIBS_MINSIZEREL}"    # libraries
                              "${asio_LIB_DIRS_MINSIZEREL}" # package_libdir
                              "${asio_BIN_DIRS_MINSIZEREL}" # package_bindir
                              "${asio_LIBRARY_TYPE_MINSIZEREL}"
                              "${asio_IS_HOST_WINDOWS_MINSIZEREL}"
                              asio_DEPS_TARGET
                              asio_LIBRARIES_TARGETS  # out_libraries_targets
                              "_MINSIZEREL"
                              "asio"    # package_name
                              "${asio_NO_SONAME_MODE_MINSIZEREL}")  # soname

# FIXME: What is the result of this for multi-config? All configs adding themselves to path?
set(CMAKE_MODULE_PATH ${asio_BUILD_DIRS_MINSIZEREL} ${CMAKE_MODULE_PATH})

########## GLOBAL TARGET PROPERTIES MinSizeRel ########################################
    set_property(TARGET asio::asio
                 APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                 $<$<CONFIG:MinSizeRel>:${asio_OBJECTS_MINSIZEREL}>
                 $<$<CONFIG:MinSizeRel>:${asio_LIBRARIES_TARGETS}>
                 )

    if("${asio_LIBS_MINSIZEREL}" STREQUAL "")
        # If the package is not declaring any "cpp_info.libs" the package deps, system libs,
        # frameworks etc are not linked to the imported targets and we need to do it to the
        # global target
        set_property(TARGET asio::asio
                     APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                     asio_DEPS_TARGET)
    endif()

    set_property(TARGET asio::asio
                 APPEND PROPERTY INTERFACE_LINK_OPTIONS
                 $<$<CONFIG:MinSizeRel>:${asio_LINKER_FLAGS_MINSIZEREL}>)
    set_property(TARGET asio::asio
                 APPEND PROPERTY INTERFACE_INCLUDE_DIRECTORIES
                 $<$<CONFIG:MinSizeRel>:${asio_INCLUDE_DIRS_MINSIZEREL}>)
    # Necessary to find LINK shared libraries in Linux
    set_property(TARGET asio::asio
                 APPEND PROPERTY INTERFACE_LINK_DIRECTORIES
                 $<$<CONFIG:MinSizeRel>:${asio_LIB_DIRS_MINSIZEREL}>)
    set_property(TARGET asio::asio
                 APPEND PROPERTY INTERFACE_COMPILE_DEFINITIONS
                 $<$<CONFIG:MinSizeRel>:${asio_COMPILE_DEFINITIONS_MINSIZEREL}>)
    set_property(TARGET asio::asio
                 APPEND PROPERTY INTERFACE_COMPILE_OPTIONS
                 $<$<CONFIG:MinSizeRel>:${asio_COMPILE_OPTIONS_MINSIZEREL}>)

########## For the modules (FindXXX)
set(asio_LIBRARIES_MINSIZEREL asio::asio)

# Avoid multiple calls to find_package to append duplicated properties to the targets
include_guard()########### VARIABLES #######################################################################
#############################################################################################
set(asio_FRAMEWORKS_FOUND_DEBUG "") # Will be filled later
conan_find_apple_frameworks(asio_FRAMEWORKS_FOUND_DEBUG "${asio_FRAMEWORKS_DEBUG}" "${asio_FRAMEWORK_DIRS_DEBUG}")

set(asio_LIBRARIES_TARGETS "") # Will be filled later


######## Create an interface target to contain all the dependencies (frameworks, system and conan deps)
if(NOT TARGET asio_DEPS_TARGET)
    add_library(asio_DEPS_TARGET INTERFACE IMPORTED)
endif()

set_property(TARGET asio_DEPS_TARGET
             APPEND PROPERTY INTERFACE_LINK_LIBRARIES
             $<$<CONFIG:Debug>:${asio_FRAMEWORKS_FOUND_DEBUG}>
             $<$<CONFIG:Debug>:${asio_SYSTEM_LIBS_DEBUG}>
             $<$<CONFIG:Debug>:>)

####### Find the libraries declared in cpp_info.libs, create an IMPORTED target for each one and link the
####### asio_DEPS_TARGET to all of them
conan_package_library_targets("${asio_LIBS_DEBUG}"    # libraries
                              "${asio_LIB_DIRS_DEBUG}" # package_libdir
                              "${asio_BIN_DIRS_DEBUG}" # package_bindir
                              "${asio_LIBRARY_TYPE_DEBUG}"
                              "${asio_IS_HOST_WINDOWS_DEBUG}"
                              asio_DEPS_TARGET
                              asio_LIBRARIES_TARGETS  # out_libraries_targets
                              "_DEBUG"
                              "asio"    # package_name
                              "${asio_NO_SONAME_MODE_DEBUG}")  # soname

# FIXME: What is the result of this for multi-config? All configs adding themselves to path?
set(CMAKE_MODULE_PATH ${asio_BUILD_DIRS_DEBUG} ${CMAKE_MODULE_PATH})

########## GLOBAL TARGET PROPERTIES Debug ########################################
    set_property(TARGET asio::asio
                 APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                 $<$<CONFIG:Debug>:${asio_OBJECTS_DEBUG}>
                 $<$<CONFIG:Debug>:${asio_LIBRARIES_TARGETS}>
                 )

    if("${asio_LIBS_DEBUG}" STREQUAL "")
        # If the package is not declaring any "cpp_info.libs" the package deps, system libs,
        # frameworks etc are not linked to the imported targets and we need to do it to the
        # global target
        set_property(TARGET asio::asio
                     APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                     asio_DEPS_TARGET)
    endif()

    set_property(TARGET asio::asio
                 APPEND PROPERTY INTERFACE_LINK_OPTIONS
                 $<$<CONFIG:Debug>:${asio_LINKER_FLAGS_DEBUG}>)
    set_property(TARGET asio::asio
                 APPEND PROPERTY INTERFACE_INCLUDE_DIRECTORIES
                 $<$<CONFIG:Debug>:${asio_INCLUDE_DIRS_DEBUG}>)
    # Necessary to find LINK shared libraries in Linux
    set_property(TARGET asio::asio
                 APPEND PROPERTY INTERFACE_LINK_DIRECTORIES
                 $<$<CONFIG:Debug>:${asio_LIB_DIRS_DEBUG}>)
    set_property(TARGET asio::asio
                 APPEND PROPERTY INTERFACE_COMPILE_DEFINITIONS
                 $<$<CONFIG:Debug>:${asio_COMPILE_DEFINITIONS_DEBUG}>)
    set_property(TARGET asio::asio
                 APPEND PROPERTY INTERFACE_COMPILE_OPTIONS
                 $<$<CONFIG:Debug>:${asio_COMPILE_OPTIONS_DEBUG}>)

########## For the modules (FindXXX)
set(asio_LIBRARIES_DEBUG asio::asio)

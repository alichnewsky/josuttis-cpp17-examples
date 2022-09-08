include(stringPrefix)

string_starts_with (${CMAKE_CXX_COMPILER} "/opt/rh/devtoolset" CXX_COMPILER_IS_DEVTOOLSET )

message( STATUS "CMAKE_SYSTEM_VERSION=${CMAKE_SYSTEM_VERSION}")

#cmake_host_system_information(RESULT PRETTY_NAME QUERY DISTRIB_PRETTY_NAME)
#message(STATUS "${PRETTY_NAME}")

cmake_host_system_information(RESULT DISTRO QUERY DISTRIB_INFO)

foreach(VAR IN LISTS DISTRO)
    message(STATUS "${VAR}=`${${VAR}}`")
endforeach()

if ( ${CXX_COMPILER_IS_DEVTOOLSET} )
    string(  REPLACE "/opt/rh/devtoolset-"  "" CXX_COMPILER_DEVTOOLSET_VERSION ${CMAKE_CXX_COMPILER})
    string(  REPLACE "/root/usr/bin/g++"    "" CXX_COMPILER_DEVTOOLSET_VERSION ${CXX_COMPILER_DEVTOOLSET_VERSION})
    message( STATUS "detected devtoolset ${CXX_COMPILER_DEVTOOLSET_VERSION}" )
endif()

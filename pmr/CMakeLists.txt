add_executable(pmr0 pmr0.cpp)
add_executable(pmr1 pmr1.cpp)
add_executable(pmrsync0 pmrsync0.cpp)

# read this : std::pmr::string not available (via devtoolset on rh7)
# https://access.redhat.com/documentation/en-us/red_hat_developer_toolset/10/html-single/user_guide/index#sect-GCC-CPP-Compatibility-ABI-CPP
# https://access.redhat.com/documentation/en-us/red_hat_developer_toolset/11/html-single/user_guide/index#sect-GCC-CPP-Compatibility-ABI-CPP
# before that, devtoolset-9 : c++17 it is experimental, not supported
message( STATUS "CMAKE_SYSTEM_VERSION=${CMAKE_SYSTEM_VERSION}")

cmake_host_system_information(RESULT PRETTY_NAME QUERY DISTRIB_PRETTY_NAME)
message(STATUS "${PRETTY_NAME}")

cmake_host_system_information(RESULT DISTRO QUERY DISTRIB_INFO)

foreach(VAR IN LISTS DISTRO)
    message(STATUS "${VAR}=`${${VAR}}`")
endforeach()

## `(<str:<string>> <search:<string>>)-><bool>`
##
## Returns true if "str" starts with the string "search"
##
## **Examples**
##  string_starts_with("substring" "sub") # => true
##  string_starts_with("substring" "ub") # => false
##
##
function(string_starts_with str search result)
    string(FIND "${str}" "${search}" out)
    if(${out} EQUAL 0)
        set( ${result} TRUE  PARENT_SCOPE)
    else()
        set( ${result} FALSE PARENT_SCOPE)
    endif()
endfunction()

string_starts_with (${CMAKE_CXX_COMPILER} "/opt/rh/devtoolset" CXX_COMPILER_IS_DEVTOOLSET )

if ( ${CXX_COMPILER_IS_DEVTOOLSET} AND ${DISTRO_REDHAT_SUPPORT_PRODUCT_VERSION} EQUAL 7)
    message( WARNING "devtoolset-x on Redhat 7 does not support c++17's std::pmr::string even when it says it does c++17" )
else ()

    message( WARNING "${CMAKE_CXX_COMPILER} does not start with /opt/rh/devtoolset it seems OR DISTRO_VERSION_ID=${DISTRO_VERSION_ID} != 7" )
    add_executable(pmrcustomer1 pmrcustomer1.cpp)
    add_executable(pmr2 pmr2.cpp)
    add_executable(pmr3 pmr3.cpp)
    add_executable(pmrnull pmrnull.cpp)
    add_executable(pmrsync1 pmrsync1.cpp)
    add_executable(tracker tracker.cpp)
endif()
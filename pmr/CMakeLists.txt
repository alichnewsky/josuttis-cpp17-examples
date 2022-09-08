add_executable(pmr0 pmr0.cpp)
add_executable(pmr1 pmr1.cpp)
add_executable(pmrsync0 pmrsync0.cpp)

foreach( t pmr0 pmr1 pmrsync0)
    add_test(${t} ${t})
endforeach()
# read this : std::pmr::string not available (via devtoolset on rh7)
# https://access.redhat.com/documentation/en-us/red_hat_developer_toolset/10/html-single/user_guide/index#sect-GCC-CPP-Compatibility-ABI-CPP
# https://access.redhat.com/documentation/en-us/red_hat_developer_toolset/11/html-single/user_guide/index#sect-GCC-CPP-Compatibility-ABI-CPP
# before that, devtoolset-9 : c++17 it is experimental, not supported

if ( ${CXX_COMPILER_IS_DEVTOOLSET} AND "${DISTRO_REDHAT_SUPPORT_PRODUCT_VERSION}" EQUAL 7)
    message( WARNING "devtoolset-x on Redhat 7 does not support c++17's std::pmr::string even when it says it does c++17" )
    message( WARNING "https://access.redhat.com/documentation/en-us/red_hat_developer_toolset/10/html-single/user_guide/index#sect-GCC-CPP-Compatibility-ABI-CPP")
else ()
    add_executable(pmrcustomer1 pmrcustomer1.cpp)
    add_executable(pmr2 pmr2.cpp)
    add_executable(pmr3 pmr3.cpp)
    add_executable(pmrnull pmrnull.cpp)
    add_executable(pmrsync1 pmrsync1.cpp)
    add_executable(tracker tracker.cpp)
    foreach( t pmrcustomer1 pmr2 pmr3 pmrnull pmprsync1 tracker)
        add_test(${t} ${t})
    endforeach()

endif()
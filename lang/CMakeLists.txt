
add_executable( alignednew11 alignednew11.cpp alignednew11.hpp)
add_executable( alignednew17 alignednew17.cpp )
add_executable( alignednewincomp alignednewincomp.cpp )
add_executable( evalexcept evalexcept.cpp )
add_executable( factory factory.cpp factory.hpp)
add_executable( hexfloat hexfloat.cpp )
add_executable( inlinethreadlocal inlinethreadlocal1.cpp inlinethreadlocal2.cpp inlinethreadlocal.hpp)
target_link_libraries(inlinethreadlocal PRIVATE pthread )
add_executable( lambdathis lambdathis.cpp )
target_link_libraries(lambdathis PRIVATE pthread )

add_executable( structbind1 structbind1.cpp structbind1.hpp customer1.hpp )
add_executable( structbind2 structbind2.cpp structbind2.hpp customer2.hpp)
add_executable( tracknew tracknew.cpp tracknew.hpp)

# still unclear how to properly use try_compile...
# now should fail.
try_compile( aggr14_BUILT ${CMAKE_CURRENT_BINARY_DIR} ${CMAKE_CURRENT_SOURCE_DIR}/aggr14.cpp )
if ( aggr14_BUILT)
    message( FATAL_ERROR "aggr14.cpp should now fail to compile but has worked" )
endif()
# should fail as well
try_compile( noexceptcalls_BUILT ${CMAKE_CURRENT_BINARY_DIR} ${CMAKE_CURRENT_SOURCE_DIR}/noexceptcalls.cpp )
if (noexceptcalls_BUILT)
    message( FATAL_ERROR "noexceptcalls.cpp should now fail to compile but has worked" )
endif()

list(APPEND all_targets alignednew11;alignednew17;alignednewincomp;evalexcept;factory;hexfloat;inlinethreadlocal;lambdathis;structbind1;structbind2;tracknew)

foreach( t ${all_targets})
    add_test(${t} ${t})
endforeach()
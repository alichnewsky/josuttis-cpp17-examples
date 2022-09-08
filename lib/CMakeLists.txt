add_executable(accumulate accumulate.cpp)
add_executable(accumulate2 accumulate2.cpp)
add_executable(asint asint.cpp)
add_executable(chronoext chronoext.cpp)
add_executable(clamp clamp.cpp)

list( APPEND all_targets accumulate;accumulate2;asint;chronoext;clamp;foreachn;incomplete;nodehandle;nodemerge;nodemove;optional;optionalmember;)
list( APPEND all_targets reduce;sample1;sample2;scan;transformreduce1;transformreduce2;transformscan;uncaught)
list( APPEND all_targets variant;variantpoly1;variantpoly2;variantpoly3)

list ( APPEND targets_with_tbb_error parforeach;parforeachloop;parreduce;parreduce2;parreducefloat;partransformreduce;searcher1;searcher2 )

if ( NOT ${CXX_COMPILER_IS_DEVTOOLSET} OR  "${CXX_COMPILER_DEVTOOLSET_VERSION}" GREATER 9 )
    add_executable(dirsize dirsize.cpp)
    add_executable(parforeach parforeach.cpp timer.hpp)
    add_executable(parforeachloop parforeachloop.cpp timer.hpp)
    add_executable(parreduce parreduce.cpp)
    add_executable(parreduce2 parreduce2.cpp)
    add_executable(parreducefloat parreducefloat.cpp)
    add_executable(partransformreduce partransformreduce.cpp)
    add_executable(searcher1 searcher1.cpp)
    add_executable(searcher2 searcher2.cpp)

    add_test(dirsize dirsize /tmp )
    list(APPEND all_targets ${targets_with_tbb_error})
else()
    message(WARNING "on Centos 7 devtooset-9 does not package tbb correctly and GCC 9 implementation of parallel containers does not compile")
    message( WARNING "did not build targets dirsize;${targets_with_tbb_error}" )

    try_compile(parforeach_BUILT ${CMAKE_CURRENT_BINARY_DIR} SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/parforeach.cpp OUTPUT_VARIABLE error)
    if ( NOT parforeach_BUILT )
        message( WARNING "${error}")
    endif()
endif()

add_executable(foreachn foreachn.cpp)
add_executable(incomplete incomplete.cpp)
add_executable(nodehandle nodehandle.cpp)
add_executable(nodemerge nodemerge.cpp)
add_executable(nodemove nodemove.cpp)
add_executable(optional optional.cpp)
add_executable(optionalmember optionalmember.cpp)
add_executable(reduce reduce.cpp)
add_executable(sample1 sample1.cpp)
add_executable(sample2 sample2.cpp)
add_executable(scan scan.cpp)
add_executable(transformreduce1 transformreduce1.cpp)
add_executable(transformreduce2 transformreduce2.cpp)
add_executable(transformscan transformscan.cpp)
add_executable(uncaught uncaught.cpp)
add_executable(variant variant.cpp)
add_executable(variantpoly1 variantpoly1.cpp circle.hpp coord.hpp line.hpp rectangle.hpp incomplete.hpp)
add_executable(variantpoly2 variantpoly2.cpp)
add_executable(variantpoly3 variantpoly3.cpp ../tmpl/overload.hpp )

foreach( t ${all_targets})
    add_test( ${t} ${t})
endforeach()

# fails to compile with gcc 10 and 9 on devtooset...
# godbolt has them fail on pretty much any compiler, thoguh.
# this one seems fixed in gcc 11.x
# it would have been interesting.
#
try_compile( charconv_BUILT ${CMAKE_CURRENT_BINARY_DIR} ${CMAKE_CURRENT_SOURCE_DIR}/charconv.cpp)# OUTPUT_VARIABLE error)
if ( NOT charconv_BUILT)
    message( WARNING "failed to compile charconv example") #\\n${error}")
else()
    add_executable(charconv charconv.cpp charconv.hpp)
endif()
# this one is important,
# does not compile with devtoolset-10
try_compile( variantvisit_BUILT ${CMAKE_CURRENT_BINARY_DIR} ${CMAKE_CURRENT_SOURCE_DIR}/variantvisit.cpp) # OUTPUT_VARIABLE error)

if ( NOT variantvisit_BUILT )
    message( WARNING "failed to compile variantvisit example") #\\n${error}")
else()
    #add_executable(variantvisit variantvisit.cpp)
endif()
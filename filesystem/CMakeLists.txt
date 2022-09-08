add_executable(checkpath1 checkpath1.cpp)
add_executable(checkpath2 checkpath2.cpp)
add_executable(checkpath3 checkpath3.cpp)
add_executable(createfiles createfiles.cpp)

add_test(checkpath1 checkpath1 /tmp)
add_test(checkpath2 checkpath2 /tmp)
add_test(checkpath3 checkpath3 /tmp)
add_test(createfiles createfiles /tmp )
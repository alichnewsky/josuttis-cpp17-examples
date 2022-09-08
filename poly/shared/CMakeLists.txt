add_executable(shared_geoobjtest geoobjtest.cpp circle.hpp coord.hpp geoobj.hpp line.hpp polygon.hpp tracknew.hpp)
add_test(shared_geoobjtest, shared_geoobjtest)
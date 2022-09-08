# [Nicolai Josuttis' C++17 book examples](https://www.cppstd17.com/)
```
Nicolai M. Josuttis
C++17 - The Complete Guide
Leanpub, 2017
For further informations see: https://www.cppstd17.com/
```

[All sample code comes from this link](https://www.cppstd17.com/code/code.html)
and is licensed  under a [Creative Commons Attribution-SharedAlike 4.0 International License. CC BY-SA 4.0](http://creativecommons.org/licenses/by-sa/4.0/), 
as per the original author's instructions.

It is pretty much as is, apart from one missing `#include <cmath>` statement...


CMakeLists.txt and module files are my own, and I chose the same license, CC BY-SA 4.0

## why put this code on github?
I don't intend this repository as a study of C+17, but rather as a study of
* various compiler's support of the language
   * devtoolset-9, 10, 11, ... under CentOS 7.9 for starters
   * whatever  `c++` and `g++` Apple installed on my laptop
* CMake's `try_compile`, `CMAKE_CXX_KNOWN_FEATURES` support etc.
* the ability for my [IDE of choice, CLion](https://www.jetbrains.com/clion/) to build these with various toolchains, including `docker` containers based ones.

## why stop to c++17 ? 
similar work with `https://cppstd20.com/` examples will follow
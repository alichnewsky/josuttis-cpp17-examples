## `(<str:<string>> <search:<string>> <result:<bool>>)
##
## Returns true if "str" starts with the string "search"
##
## **Examples**
##  string_starts_with("substring" "sub" result) # => true
##  string_starts_with("substring" "ub" result) # => false
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

file(READ configure.ac CONFIGURE_AC_CONTENTS)
string(REGEX MATCH "AC_INIT\\(IlmBase,[ ]*([0-9]+).([0-9]+).([0-9]+)" DUMMY ${CONFIGURE_AC_CONTENTS})
set(ILMBASE_VERSION_MAJOR ${CMAKE_MATCH_1})
set(ILMBASE_VERSION_MINOR ${CMAKE_MATCH_2})
set(ILMBASE_VERSION_PATCH ${CMAKE_MATCH_3})
set(ILMBASE_VERSION       ${ILMBASE_VERSION_MAJOR}.${ILMBASE_VERSION_MINOR}.${ILMBASE_VERSION_PATCH})
set(ILMBASE_VERSION_API   ${ILMBASE_VERSION_MAJOR}_${ILMBASE_VERSION_MINOR})
string(REGEX MATCH "LIBTOOL_CURRENT=([0-9]+)" DUMMY ${CONFIGURE_AC_CONTENTS})
set(ILMBASE_SOCURRENT ${CMAKE_MATCH_1})
string(REGEX MATCH "LIBTOOL_REVISION=([0-9]+)" DUMMY ${CONFIGURE_AC_CONTENTS})
set(ILMBASE_SOREVISION ${CMAKE_MATCH_1})
string(REGEX MATCH "LIBTOOL_AGE=([0-9]+)" DUMMY ${CONFIGURE_AC_CONTENTS})
set(ILMBASE_SOAGE ${CMAKE_MATCH_1})
math(EXPR ILMBASE_SOVERSION "${ILMBASE_SOCURRENT} - ${ILMBASE_SOAGE}")
set(ILMBASE_LIB_VERSION "${ILMBASE_SOVERSION}.${ILMBASE_SOAGE}.${ILMBASE_SOREVISION}")
message(STATUS "Configure ILMBASE Version: ${ILMBASE_VERSION} Lib API: ${ILMBASE_LIB_VERSION}")
unset(CONFIGURE_AC_CONTENTS)
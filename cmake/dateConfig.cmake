include( CMakeFindDependencyMacro )

# Importing battzdata::battzdata via find_dependency(BatTzData) is not needed
# because the importet target does not contain any usage infos. 
# battzdata is only interesting, when building date-tz. 
# The target battzdata::battzdata must exists anyway because the generated 
# dateTargets.cmake  will reference it as dependency.
# So lets create a dummy:
add_library( battzdata::battzdata INTERFACE IMPORTED)

include( "${CMAKE_CURRENT_LIST_DIR}/dateTargets.cmake" )

if( NOT MSVC AND TARGET date::date-tz )
    find_dependency( Threads REQUIRED)
    get_target_property( _tzill date::date-tz  INTERFACE_LINK_LIBRARIES )
    if( _tzill AND "${_tzill}" MATCHES "libcurl" )
        find_dependency( CURL )
    endif( )
endif( )

#if (TARGET date::date-tz AND @USE_BAT_TZ_DB@)
#    find_dependency( BatTzdata REQUIRED)
#endif()

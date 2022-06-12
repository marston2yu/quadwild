include(${CMAKE_CURRENT_LIST_DIR}/patterns/patterns.cmake)

set(SOURCES ${SOURCES}
#        ${CMAKE_CURRENT_LIST_DIR}/quadretopology/includes/qr_charts.cpp
#        ${CMAKE_CURRENT_LIST_DIR}/quadretopology/includes/qr_convert.cpp
#        ${CMAKE_CURRENT_LIST_DIR}/quadretopology/includes/qr_ilp.cpp
#        ${CMAKE_CURRENT_LIST_DIR}/quadretopology/includes/qr_patterns.cpp
        ${CMAKE_CURRENT_LIST_DIR}/quadretopology/includes/qr_mapping.cpp
#        ${CMAKE_CURRENT_LIST_DIR}/quadretopology/includes/qr_utils.cpp
#        ${CMAKE_CURRENT_LIST_DIR}/quadretopology/quadretopology.cpp
        )

set(HEADERS ${HEADERS}
        ${CMAKE_CURRENT_LIST_DIR}/quadretopology/includes/qr_convert.h
        ${CMAKE_CURRENT_LIST_DIR}/quadretopology/includes/qr_charts.h
        ${CMAKE_CURRENT_LIST_DIR}/quadretopology/includes/qr_ilp.h
        ${CMAKE_CURRENT_LIST_DIR}/quadretopology/includes/qr_parameters.h
        ${CMAKE_CURRENT_LIST_DIR}/quadretopology/includes/qr_patterns.h
        ${CMAKE_CURRENT_LIST_DIR}/quadretopology/includes/qr_mapping.h
        ${CMAKE_CURRENT_LIST_DIR}/quadretopology/includes/qr_utils.h
        ${CMAKE_CURRENT_LIST_DIR}/quadretopology/quadretopology.h)
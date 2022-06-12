cmake_minimum_required(VERSION 3.16)
project(quadwild VERSION 1.0 LANGUAGES CXX)

list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}")
include(libs/libs.cmake)
include(${QUADRETOPOLOGY_PATH}/quadretopology.cmake)
find_package(GUROBI REQUIRED)
set(CMAKE_INCLUDE_CURRENT_DIR ON)


add_executable(quadwild WIN32
        ${HEADERS}
        ${SOURCES}
        components/quad_from_patches/load_save.cpp components/quad_from_patches/load_save.h
        components/quad_from_patches/quad_from_patches.h
        quadwild/functions.h
        ${LIBIGL_PATH}/include/igl/principal_curvature.h
        quadwild/quadwild.cpp
        ${VCGLIB_PATH}/wrap/ply/plylib.cpp ${VCGLIB_PATH}/wrap/ply/plylib.h
        )
target_include_directories(quadwild PRIVATE
        components/field_computation
        components/field_tracing
        components/quad_from_patches
        ${GUROBI_INCLUDE_DIRS}
        /usr/include/boost
        ${EIGEN_PATH}
        ${LIBIGL_PATH}/include
        ${VCGLIB_PATH}
        ${QUADRETOPOLOGY_PATH}
        )

target_compile_definitions(quadwild PRIVATE
        GLEW_STATIC
        GUROBI_DEFINED
        INCLUDE_TEMPLATES
        )

target_link_libraries(quadwild PRIVATE
        #        -L/home/marston/packages/gurobi951/linux64/lib
        #    Qt::Core
        #    Qt::Gui
        -no-pie
        -pthread
        ${LPSOLVE_LIB_PATH}/liblpsolve55.a
        -ldl
        ${GUROBI_CXX_LIBRARY} ${GUROBI_LIBRARY}
        -lgurobi_c++
        -lgurobi95
        )

target_compile_options(quadwild PRIVATE
        -isystem
        )

if (CMAKE_BUILD_TYPE STREQUAL Debug)
    target_compile_definitions(quadwild PRIVATE
            DEBUG
            )
endif ()

if (CMAKE_BUILD_TYPE STREQUAL Release)
    target_compile_definitions(quadwild PRIVATE
            -DEBUG
            )
endif ()

if (FINAL_RELEASE AND UNIX AND NOT MACOS)
    target_compile_definitions(quadwild PRIVATE
            NDEBUG
            )

    target_compile_options(quadwild
            -O3
            )
endif ()

if (DEFINES___contains___COMISO_FIELD)
    target_sources(quadwild PUBLIC
            ${LIBIGL_PATH}/include/igl/copyleft/comiso/nrosy.cpp ${LIBIGL_PATH}/include/igl/copyleft/comiso/nrosy.h
            )

    target_include_directories(quadwild PRIVATE
            ${COMISO_PATH}/..
            ${GMM_PATH}/include
            )

    target_link_libraries(quadwild PRIVATE
            # Remove: L${CMAKE_CURRENT_SOURCE_DIR}/CoMISo//build/Build/lib/CoMISo/
            CoMISo
            )
endif ()

if (UNIX AND NOT APPLE)
    target_link_libraries(quadwild PRIVATE
            # Remove: fopenmp
            )

    target_compile_options(quadwild PRIVATE
            -fopenmp
            )
endif ()

if (WIN32)
    target_compile_definitions(quadwild PRIVATE
            NOMINMAX
            _SCL_SECURE_NO_DEPRECATE
            _USE_MATH_DEFINES
            )

    target_compile_options(quadwild
            /bigobj
            )
endif ()

install(TARGETS quadwild
        BUNDLE DESTINATION .
        RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
        )

# Consider using qt_generate_deploy_app_script() for app deployment if
# the project can use Qt 6.3. In that case rerun qmake2cmake with
# --min-qt-version=6.3.

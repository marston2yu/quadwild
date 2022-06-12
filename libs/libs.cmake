############################ CONFIGURATION ############################

# DEFINES += COMISO_FIELD


############################ LIBRARY PATHS ############################

#Libraries
set(QUADRETOPOLOGY_PATH "${CMAKE_CURRENT_LIST_DIR}/quadretopology/")
set(LIBIGL_PATH         "${CMAKE_CURRENT_LIST_DIR}/libigl/")
set(VCGLIB_PATH         "${CMAKE_CURRENT_LIST_DIR}/vcglib/")
set(GLEW_PATH           "${CMAKE_CURRENT_LIST_DIR}/glew/")
set(COMISO_PATH         "${CMAKE_CURRENT_LIST_DIR}/CoMISo/")
set(GMM_PATH            "${CMAKE_CURRENT_LIST_DIR}/CoMISo/gmm/")
set(EIGEN_PATH          "${CMAKE_CURRENT_LIST_DIR}/eigen/")
set(LPSOLVE_LIB_PATH   "${CMAKE_CURRENT_LIST_DIR}/liblpsolve/")

#GUI external libraries (needed only for field_computation and field_tracing projects)
set(ANTTWEAKBAR_PATH   "/opt/AntTweakBar/")

#External libraries
set(BOOST_PATH         "/usr/include/boost/")
set(GUROBI_PATH        "/home/marston/packages/gurobi951/linux64/")
set(GUROBI_COMPILER    "gurobi_g++5.2")
set(GUROBI_LIB         "gurobi95")

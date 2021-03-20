# ****************************************************************************
#  Project:  LibCMaker_POCO
#  Purpose:  A CMake build script for POCO library
#  Author:   NikitaFeodonit, nfeodonit@yandex.com
# ****************************************************************************
#    Copyright (c) 2017-2021 NikitaFeodonit
#
#    This file is part of the LibCMaker_POCO project.
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published
#    by the Free Software Foundation, either version 3 of the License,
#    or (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
#    See the GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program. If not, see <http://www.gnu.org/licenses/>.
# ****************************************************************************

#-----------------------------------------------------------------------
# The file is an example of the convenient script for the library build.
#-----------------------------------------------------------------------

#-----------------------------------------------------------------------
# Lib's name, version, paths
#-----------------------------------------------------------------------

set(POCO_lib_NAME "POCO")
set(POCO_lib_VERSION "1.10.1" CACHE STRING "POCO_lib_VERSION")
set(POCO_lib_COMPONENTS Foundation CACHE STRING "POCO_lib_COMPONENTS")
set(POCO_lib_DIR "${CMAKE_CURRENT_LIST_DIR}" CACHE PATH "POCO_lib_DIR")

# To use our Find<LibName>.cmake.
list(APPEND CMAKE_MODULE_PATH "${POCO_lib_DIR}/cmake/modules")


#-----------------------------------------------------------------------
# LibCMaker_<LibName> specific vars and options
#-----------------------------------------------------------------------

option(COPY_POCO_CMAKE_BUILD_SCRIPTS "COPY_POCO_CMAKE_BUILD_SCRIPTS" ON)


#-----------------------------------------------------------------------
# Library specific vars and options
#-----------------------------------------------------------------------

option(BUILD_SHARED_LIBS "Build shared libraries" ON)

if(MSVC)
# Set by BUILD_SHARED_LIBS in 'cmr_find_package_poco.cmake'.
#  option(POCO_MT "Set to OFF|ON (default is OFF) to control build of POCO as /MT instead of /MD" OFF)

  # allow disabling of internally built OpenSSL# (see below for details)
  # if POCO pre-built OpenSSL directory is found, and POCO_DISABLE_INTERNAL_OPENSSL=OFF,
  # the internal OpenSSL build will be used
  option(POCO_DISABLE_INTERNAL_OPENSSL "Disable internal OpensSSL binaries use" ON)
endif()

option(ENABLE_NETSSL_WIN "Enable NetSSL Windows" OFF)
option(FORCE_OPENSSL "Force usage of OpenSSL even under windows" OFF)

option(ENABLE_NETSSL "Enable NetSSL" OFF)
option(ENABLE_CRYPTO "Enable Crypto" OFF)
option(ENABLE_JWT "Enable JWT" OFF)

option(ENABLE_APACHECONNECTOR "Enable ApacheConnector" OFF)

option(ENABLE_DATA "Enable Data" OFF)
option(ENABLE_DATA_MYSQL "Enable Data MySQL or MariaDB" OFF)
option(ENABLE_DATA_POSTGRESQL "Enable SQL PosgreSQL" OFF)
option(ENABLE_DATA_ODBC "Enable Data ODBC" OFF)

option(ENABLE_FOUNDATION "Enable Foundation, required by all components except CppUnit" ON)
option(ENABLE_ENCODINGS "Enable Encodings" ON)
option(ENABLE_ENCODINGS_COMPILER "Enable Encodings Compiler" OFF)
option(ENABLE_XML "Enable XML" OFF)
option(ENABLE_JSON "Enable JSON" OFF)
option(ENABLE_MONGODB "Enable MongoDB" OFF)
option(ENABLE_DATA_SQLITE "Enable Data SQlite" OFF)
option(ENABLE_REDIS "Enable Redis" OFF)
option(ENABLE_PDF "Enable PDF" OFF)
option(ENABLE_UTIL "Enable Util" ON)
option(ENABLE_NET "Enable Net" ON)

option(ENABLE_SEVENZIP "Enable SevenZip" ON)
option(ENABLE_ZIP "Enable Zip" ON)
option(ENABLE_CPPPARSER "Enable C++ parser" OFF)
option(ENABLE_POCODOC "Enable Poco Documentation Generator" OFF)

option(ENABLE_PAGECOMPILER "Enable PageCompiler" OFF)
option(ENABLE_PAGECOMPILER_FILE2PAGE "Enable File2Page" OFF)
option(ENABLE_TESTS
  "Set to OFF|ON (default is OFF) to control build of POCO tests & samples" OFF)

option(POCO_UNBUNDLED
  "Set to OFF|ON (default is OFF) to control linking dependencies as external" OFF)

if(MINGW OR IOS)
  set(ENABLE_PAGECOMPILER OFF CACHE BOOL "Enable PageCompiler" FORCE)
  set(ENABLE_PAGECOMPILER_FILE2PAGE OFF CACHE BOOL "Enable File2Page" FORCE)
endif()

if(MINGW)
  # https://github.com/pocoproject/poco/issues/3121
  # poco cannot be built with: net, mongodb, netssl, netssl_win and redis on mingw.
  set(ENABLE_NETSSL_WIN OFF CACHE BOOL "Enable NetSSL Windows" FORCE)
  set(ENABLE_NETSSL OFF CACHE BOOL "Enable NetSSL" FORCE)
  set(ENABLE_MONGODB OFF CACHE BOOL "Enable MongoDB" FORCE)
  set(ENABLE_REDIS OFF CACHE BOOL "Enable Redis" FORCE)
  set(ENABLE_NET OFF CACHE BOOL "Enable Net" FORCE)
endif()


#-----------------------------------------------------------------------
# Build, install and find the library
#-----------------------------------------------------------------------

cmr_find_package(
  LibCMaker_DIR   ${LibCMaker_DIR}
  NAME            ${POCO_lib_NAME}
  VERSION         ${POCO_lib_VERSION}
  COMPONENTS      ${POCO_lib_COMPONENTS}
  LIB_DIR         ${POCO_lib_DIR}
  FIND_MODULE_NAME  Poco
  REQUIRED
  CONFIG
#  NOT_USE_VERSION_IN_FIND_PACKAGE
)

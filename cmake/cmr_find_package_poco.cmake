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

# Part of "LibCMaker/cmake/cmr_find_package.cmake".

  #-----------------------------------------------------------------------
  # Library specific build arguments
  #-----------------------------------------------------------------------

## +++ Common part of the lib_cmaker_<lib_name> function +++
  set(find_LIB_VARS
    COPY_POCO_CMAKE_BUILD_SCRIPTS

    #BUILD_SHARED_LIBS
    POCO_MT
    POCO_DISABLE_INTERNAL_OPENSSL
    ENABLE_NETSSL_WIN
    FORCE_OPENSSL
    ENABLE_NETSSL
    ENABLE_CRYPTO
    ENABLE_JWT
    ENABLE_APACHECONNECTOR
    ENABLE_DATA
    ENABLE_DATA_MYSQL
    ENABLE_DATA_POSTGRESQL
    ENABLE_DATA_ODBC
    ENABLE_FOUNDATION
    ENABLE_ENCODINGS
    ENABLE_ENCODINGS_COMPILER
    ENABLE_XML
    ENABLE_JSON
    ENABLE_MONGODB
    ENABLE_DATA_SQLITE
    ENABLE_REDIS
    ENABLE_PDF
    ENABLE_UTIL
    ENABLE_NET
    ENABLE_SEVENZIP
    ENABLE_ZIP
    ENABLE_CPPPARSER
    ENABLE_POCODOC
    ENABLE_PAGECOMPILER
    ENABLE_PAGECOMPILER_FILE2PAGE
    ENABLE_TESTS
    POCO_UNBUNDLED
  )

  foreach(d ${find_LIB_VARS})
    if(DEFINED ${d})
      list(APPEND find_CMAKE_ARGS
        -D${d}=${${d}}
      )
    endif()
  endforeach()
## --- Common part of the lib_cmaker_<lib_name> function ---


  #-----------------------------------------------------------------------
  # Building
  #-----------------------------------------------------------------------

## +++ Common part of the lib_cmaker_<lib_name> function +++
  cmr_lib_cmaker_main(
    LibCMaker_DIR ${find_LibCMaker_DIR}
    NAME          ${find_NAME}
    VERSION       ${find_VERSION}
    LANGUAGES     CXX C
    BASE_DIR      ${find_LIB_DIR}
    DOWNLOAD_DIR  ${cmr_DOWNLOAD_DIR}
    UNPACKED_DIR  ${cmr_UNPACKED_DIR}
    BUILD_DIR     ${lib_BUILD_DIR}
    CMAKE_ARGS    ${find_CMAKE_ARGS}
    INSTALL
  )
## --- Common part of the lib_cmaker_<lib_name> function ---

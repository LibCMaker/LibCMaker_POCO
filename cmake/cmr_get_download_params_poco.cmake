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

# Part of "LibCMaker/cmake/cmr_get_download_params.cmake".

  include(cmr_get_version_parts)
  cmr_get_version_parts(${version} major minor patch tweak)

  if(version VERSION_EQUAL "1.10.1")
    set(arch_file_sha
      "44592a488d2830c0b4f3bfe4ae41f0c46abbfad49828d938714444e858a00818")
  endif()

  set(base_url "https://github.com/pocoproject/poco/archive")
  set(src_dir_name    "poco-${version}")
  set(arch_file_name  "${src_dir_name}-release.tar.gz")
  set(unpack_to_dir   "${unpacked_dir}/${src_dir_name}")

  # https://github.com/pocoproject/poco/archive/poco-1.10.1-release.tar.gz
  set(${out_ARCH_SRC_URL}   "${base_url}/${arch_file_name}" PARENT_SCOPE)
  set(${out_ARCH_DST_FILE}  "${download_dir}/${arch_file_name}" PARENT_SCOPE)
  set(${out_ARCH_FILE_SHA}  "${arch_file_sha}" PARENT_SCOPE)
  set(${out_SHA_ALG}        "SHA256" PARENT_SCOPE)
  set(${out_UNPACK_TO_DIR}  "${unpack_to_dir}" PARENT_SCOPE)
  set(${out_UNPACKED_SOURCES_DIR}
    "${unpack_to_dir}/poco-${src_dir_name}-release" PARENT_SCOPE
  )
  set(${out_VERSION_BUILD_DIR} "${build_dir}/${src_dir_name}" PARENT_SCOPE)

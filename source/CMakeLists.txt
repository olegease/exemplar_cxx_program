set( CMAKE_CXX_STANDARD 17 )
set( CMAKE_CXX_STANDARD_REQUIRED ON )
set( CMAKE_CXX_EXTENSIONS OFF )
# app
add_executable( ${SON8_APP} )
target_sources( ${SON8_APP} PRIVATE main.cxx )
target_compile_options( ${SON8_APP} PRIVATE $<$<CXX_COMPILER_ID:MSVC>:/utf-8 /permissive- /Zc:__cplusplus> )
# lib (static)
# -- exemplar_cxx_library
if( NOT TARGET son8__exemplar_cxx_library )
   include( FetchContent )
   message( STATUS "${SON8_APP}: FetchContent `olegease/exemplar_cxx_library`" )
   fetchcontent_declare(
      son8__exemplar_cxx_library
      GIT_REPOSITORY https://github.com/olegease/exemplar_cxx_library.git
      GIT_TAG        0ead4c64aafb44ff2778ca4f4c91924bac9e6150 # v0.0.0
   )
   fetchcontent_makeavailable( son8__exemplar_cxx_library )
endif( )
message( STATUS "${SON8_APP}: target `son8__exemplar_cxx_library` found" )
target_link_libraries( ${SON8_APP} PRIVATE son8::exemplar_cxx_library )

# GNU Affero General Public License v3.0 or later
# NO WARRANTY OF ANY KIND more details at <https://www.gnu.org/licenses/>
# SPDX-License-Identifier: AGPL-3.0-or-later
# app: `exemplar_cxx_program` C++17 Application Program Example
# Ⓒ Copyright (C) 2026 Oleg'Ease'Kharchuk ᦒ

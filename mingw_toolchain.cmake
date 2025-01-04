# Toolchain file for ming32 toolchains.  CMake options or variables support
# selecting specific toolchain prefixes.

set(CMAKE_SYSTEM_NAME Windows)

# Default to 64 bit prefix
set(TOOLCHAIN_PREFIX "x86_64-w64-mingw32")

# Allow user to designate 32 bit prefix
if (${MINGW_PLATFORM_32})
  set(TOOLCHAIN_PREFIX "i686-w64-mingw32")
endif()

if (${USE_BOOST})
    set(BOOST_ROOT "/usr/lib/${TOOLCHAIN_PREFIX}")
endif()

# Cross compilers to use for C, C++
set(CMAKE_C_COMPILER /usr/bin/${TOOLCHAIN_PREFIX}-gcc)
set(CMAKE_CXX_COMPILER /usr/bin/${TOOLCHAIN_PREFIX}-g++)

# Add path to find cross compiler toolchain binaries This path is expected for a
# linux build container with the mingw toolchains installed
set(CMAKE_FIND_ROOT_PATH /usr/${TOOLCHAIN_PREFIX})

# Toolchain file for pic32mz toolchains.

# Generic: Some platforms, e.g. bare metal embedded devices
set(CMAKE_SYSTEM_NAME Generic)

# Set path to look for XC32 toolchain based on the host platform
if(CMAKE_HOST_WIN32)
  # TODO: cleanup path separators on windows paths
  set(XC32_INSTALLATION "C:\\Program Files\\Microchip\\xc32\\v${XC32_VERSION}")
  set(XC32_TOOLCHAIN_PATH "${XC32_INSTALLATION}\\bin")
  set(CMAKE_FIND_ROOT_PATH "${XC32_TOOLCHAIN_PATH}")
  set(DFP_PATH
      "C:\\Program Files\\Microchip\\v${MPLABX_VERSION}\\packs\\Microchip\\${DFP}\\${DCP_VERSION}"
  )
elseif(CMAKE_HOST_LINUX)
  set(XC32_INSTALLATION "/opt/microchip/xc32/v${XC32_VERSION}")
  set(XC32_TOOLCHAIN_PATH "${XC32_INSTALLATION}/bin/")
  set(CMAKE_FIND_ROOT_PATH "${XC32_TOOLCHAIN_PATH}/")

  # TODO: Update to remove dependency on MPLABX installation and just look for
  # the DFP to be installed in an expected location.
  set(DFP_PATH
      "/opt/microchip/mplabx/v${MPLABX_VERSION}/packs/Microchip/${DFP}/${DCP_VERSION}"
  )
endif()

# Cross compilers to use for assembly, c, and c++
set(TOOLCHAIN_PREFIX "xc32")
set(CMAKE_ASM_COPMILER "${TOOLCHAIN_PREFIX}-gcc")
set(CMAKE_C_COPMILER "${TOOLCHAIN_PREFIX}-gcc")
set(CMAKE_CXX_COPMILER "${TOOLCHAIN_PREFIX}-g++")

# Update default behavior of FIND_XXX() commands
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)

# TODO: Setup desired base flags for compilers, assemblers and linkers

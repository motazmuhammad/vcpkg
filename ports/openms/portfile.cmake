# vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO OpenMS/OpenMS
  REF "refs/tags/release/${VERSION}"
  SHA512 65ee28f0b18d2f960b732f044accafee962fa9fbded07484c809f0f37db04109b0ddfe1c635650a3f38db2b8a30d1db4c742f51faa43b75021c86ead105e42c8
  HEAD_REF master
#  PATCHES
#    fix-cmake.patch
)

vcpkg_cmake_configure(
  SOURCE_PATH "${SOURCE_PATH}"
  ${configure_opts}

)

vcpkg_cmake_install()
vcpkg_cmake_config_fixup(PACKAGE_NAME unofficial-orc)
vcpkg_copy_pdbs()
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
file(COPY "${CMAKE_CURRENT_LIST_DIR}/usage" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}")

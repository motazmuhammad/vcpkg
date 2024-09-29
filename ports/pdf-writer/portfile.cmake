vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO galkahana/PDF-Writer
    REF "refs/tags/v${VERSION}"
    SHA512 5e0f9be1222785066a2cf80e65747e849c3a9c769912155e392b9b63ba2b4ca1ee62ddd9771e090e0ea56b57b8347eb1641f8f551364c7529e1b623080c1ebce
    HEAD_REF master
)

vcpkg_check_features(OUT_FEATURE_OPTIONS FEATURE_OPTIONS
FEATURES
    "nopng"                 PDFHuMMUS_NO_PNG  
    "nojpeg"                PDFHUMMUS_NO_DCT  
    "notiff"                PDFHUMMUS_NO_TIFF 
    "bundled"               USE_BUNDLED 
    "fuzz"                  BUILD_FUZZING_HARNESS 
)

vcpkg_cmake_configure(
    SOURCE_PATH ${SOURCE_PATH}
    # ${FEATURE_OPTIONS}

)


vcpkg_cmake_install()
 vcpkg_cmake_config_fixup(CONFIG_PATH lib/cmake/PDFHummus)
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_copy_pdbs()


# Handle copyright
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
# file(INSTALL "${CMAKE_CURRENT_LIST_DIR}/usage" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}")

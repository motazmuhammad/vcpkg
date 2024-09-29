vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO galkahana/PDF-Writer
    REF master
    SHA512 f9cc60f8c9a8832a111abb4eb80818c1ddc4a5f8bb7954b83964be65b70d92932bb2e034c63c24d8c574d0183aa852b60baf829df12d7e3e6bec81c5d5108c89
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

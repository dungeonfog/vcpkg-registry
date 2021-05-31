vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO maxbachmann/rapidfuzz-cpp
    REF d1e82379395cafc6d439c1c1e2cbe7512eaf2518
    SHA512 e2ce36cc618fa1a779efd050374931af0ef36d85d2ddc38adeeb2d5e79bc93df4043baaffa981e4d8e9fa34ddd94ae000f60a4ca71ab260312db4b7249da140a
    HEAD_REF master
  )

vcpkg_configure_cmake(
SOURCE_PATH "${SOURCE_PATH}"
PREFER_NINJA
OPTIONS
-DBUILD_TESTS=OFF
-DBUILD_BENCHMARKS=OFF
)

vcpkg_install_cmake()
# vcpkg_fixup_cmake_targets()

file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug)

vcpkg_copy_pdbs()
file(INSTALL ${SOURCE_PATH}/LICENSE DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT} RENAME copyright)

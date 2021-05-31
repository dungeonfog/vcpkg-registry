# Not working

vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO BinomialLLC/basis_universal
  REF ba1c3e40f1d434ebaf9a167b44e9b11d2bf0f765
  SHA512 a11bda8037a8a539d0e7b7d7c8ad33c6ceff70c9aa02d5bb7a9c9b88dd69b3f3379efd38218a8cd8a22b380a89522cc41d90cd383d3c1b3dd608e88784bcf417
  HEAD_REF master
)

vcpkg_configure_cmake(
  SOURCE_PATH "${SOURCE_PATH}"
  PREFER_NINJA
  OPTIONS
  -DBUILD_TESTS=OFF
)

vcpkg_install_cmake()

if (WIN32)
    set(TOOL_NAME basisu.exe)
else()
    set(TOOL_NAME basisu)
endif()

if (APPLE)
  file(COPY ${CURRENT_PACKAGES_DIR}/bin/${TOOL_NAME} DESTINATION ${CURRENT_PACKAGES_DIR}/tools/basisu)
else()
  file(COPY ${CURRENT_PACKAGES_DIR}/bin/${TOOL_NAME} DESTINATION ${CURRENT_PACKAGES_DIR}/tools/basisu)
endif()

file(INSTALL ${SOURCE_PATH}/LICENSE DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT} RENAME copyright)

# vcpkg_copy_tool_dependencies(${CURRENT_PACKAGES_DIR}/tools/basisu)
# vcpkg_fixup_cmake_targets(CONFIG_PATH basisu)

# Remove unnecessary files
file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/include)
file(REMOVE ${CURRENT_PACKAGES_DIR}/debug/bin/${TOOL_NAME})
file(REMOVE ${CURRENT_PACKAGES_DIR}/bin/${TOOL_NAME})

if(VCPKG_LIBRARY_LINKAGE STREQUAL static)
    file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/bin ${CURRENT_PACKAGES_DIR}/debug/bin)
endif()

vcpkg_copy_pdbs()
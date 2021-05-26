vcpkg_from_github(
	OUT_SOURCE_PATH SOURCE_PATH
	REPO dungeonfog/bgfx.cmake
	REF 2f2a4af7c7f2d686912df4c1a48c927757bdf586
	SHA512 cebf586191dde45a68e248c4edcae3d0ed79120b002f2f82f01b0d26ed783219335ead4cf43247ad5495b274aaa2355089fe0a6e14d0261c76b54ebda14b5ad6
	HEAD_REF master
)

vcpkg_configure_cmake(
	SOURCE_PATH "${SOURCE_PATH}"
	PREFER_NINJA
)

vcpkg_install_cmake()

file(
	INSTALL "${SOURCE_PATH}/LICENSE"
	DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"
	RENAME copyright)
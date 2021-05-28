#doesnt work

find_program(GIT git)

set(GIT_URL "https://github.com/dungeonfog/bgfx.cmake.git")
set(GIT_REV "master")

if(NOT EXISTS "${SOURCE_PATH}/.git")
	message(STATUS "Cloning and fetching submodules")
	vcpkg_execute_required_process(
	  COMMAND ${GIT} clone ${GIT_URL} --recursive ${SOURCE_PATH}
	  WORKING_DIRECTORY ${SOURCE_PATH}
	  LOGNAME clone
	)

	message(STATUS "Checkout revision ${GIT_REV}")
	vcpkg_execute_required_process(
	  COMMAND ${GIT} checkout ${GIT_REV}
	  WORKING_DIRECTORY ${SOURCE_PATH}
	  LOGNAME checkout
	)
endif()

# vcpkg_from_github(
# 	OUT_SOURCE_PATH SOURCE_PATH
# 	REPO dungeonfog/bgfx.cmake
# 	REF 2f2a4af7c7f2d686912df4c1a48c927757bdf586
# 	SHA512 cebf586191dde45a68e248c4edcae3d0ed79120b002f2f82f01b0d26ed783219335ead4cf43247ad5495b274aaa2355089fe0a6e14d0261c76b54ebda14b5ad6
# 	HEAD_REF master
# )

vcpkg_configure_cmake(
	SOURCE_PATH "${SOU	RCE_PATH}"
	PREFER_NINJA
)

vcpkg_install_cmake()
vcpkg_fixup_cmake_targets()

file(
	INSTALL "${SOURCE_PATH}/LICENSE"
	DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"
	RENAME copyright)
vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO nu-book/zxing-cpp
    REF v1.1.1
    SHA512 c7d97df147602e31e58eede54413814378895e9710cf266de984b22965a9a3f4c67648a0bf936a8bc8b213b45def59d1e5b34d6ce516265333dd2c0430554dc7
    HEAD_REF master
)

vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}
    PREFER_NINJA
    OPTIONS ${FEATURE_OPTIONS}
)

vcpkg_install_cmake()

vcpkg_fixup_cmake_targets(CONFIG_PATH lib/cmake/ZXing TARGET_PATH share/${PORT})

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

configure_file(${CMAKE_CURRENT_LIST_DIR}/${PORT}-config.cmake  ${CURRENT_PACKAGES_DIR}/share/${PORT} COPYONLY)
file(INSTALL ${SOURCE_PATH}/LICENSE.ZXing DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT} RENAME copyright)
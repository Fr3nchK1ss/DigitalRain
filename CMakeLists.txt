cmake_minimum_required(VERSION 3.16)

project(appDigitalRain VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.2 COMPONENTS Quick REQUIRED)

qt_add_executable(${CMAKE_PROJECT_NAME}
    main.cpp
)

qt_add_qml_module(${CMAKE_PROJECT_NAME}
    URI DigitalRain
    VERSION 1.0
    QML_FILES main.qml 
              DigitalRainParticleSystem.qml
)


qt_add_resources(${CMAKE_PROJECT_NAME} "images"
    PREFIX "/DigitalRain"
    FILES
        images/icon_interval.png
        images/icon_logging.png
        images/icon_settings.png
        images/digitalRainSprite.png
)

set_target_properties(${CMAKE_PROJECT_NAME} PROPERTIES
    MACOSX_BUNDLE_GUI_IDENTIFIER my.example.com
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(${CMAKE_PROJECT_NAME}
    PRIVATE Qt6::Quick)

install(TARGETS ${CMAKE_PROJECT_NAME}
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR})

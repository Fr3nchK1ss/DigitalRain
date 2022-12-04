import QtQuick
import QtQuick3D
import QtQuick3D.Particles3D

Window {
    id: mainWindow
    width: 1280
    height: 720
    visible: true
    title: qsTr("Matrix Digital Rain")


    QtObject {
        id: settings
        // AA
        property int antialiasingMode: SceneEnvironment.NoAA
        property int antialiasingQuality: SceneEnvironment.High
        property int symbolWidth: 20
    }

    View3D {
        anchors.fill:  parent

        environment: SceneEnvironment {
            clearColor: "black"
            backgroundMode:  SceneEnvironment.Color
            antialiasingMode: settings.antialiasingMode
            antialiasingQuality: settings.antialiasingQuality
        }

        PerspectiveCamera {
            id: camera
            position: Qt.vector3d(0, 0, 400)
        }

        Node {
            id: rainSpawnerNode

            function addRainLine(index)
            {
                var xPos = index * settings.symbolWidth - mainWindow.width/2;
                var yPos = Math.random() * 350 + mainWindow.height/2;

                // https://doc.qt.io/qt-6/qtqml-javascript-dynamicobjectcreation.html
                var rainParticleComponent = Qt.createComponent("DigitalRainParticleSystem.qml");
                rainParticleComponent.createObject(rainSpawnerNode,
                                                   {emitterPos: Qt.vector3d(xPos, yPos, 0)});
            }
        }

        Component.onCompleted: {
            for (var i = 0; i < mainWindow.width/settings.symbolWidth; ++i)
                rainSpawnerNode.addRainLine(i)
        }

    }




}

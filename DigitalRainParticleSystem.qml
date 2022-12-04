import QtQuick
import QtQuick3D
import QtQuick3D.Particles3D


ParticleSystem3D {
    id: rainSystem
    required property vector3d emitterPos

    //Particles
    SpriteParticle3D {
        id: rainParticles
        sprite: Texture {
            source: "images/digitalRainSprite.png"
        }
        spriteSequence: SpriteSequence3D{
            id: rainParticlesSequence
            frameCount: 128 // The sprite has 128 symbols
            animationDirection: SpriteSequence3D.SingleFrame
            randomStart: true
            duration: 10000 // Each frame is shown for 10sec
        }
        maxAmount: 100 // Max 100 particles at the same time
        blendMode: SpriteParticle3D.Screen
    }

    // Emitter
    ParticleEmitter3D {
        id: rainEmitter
        particle: rainParticles
        particleScale: 5 // empirical
        velocity: VectorDirection3D {
            direction: Qt.vector3d(0, -100, 0)
        }
        //
        lifeSpan: 7000
    }

    // The timer creates an infinite loop renewed every 'interval'
    Timer {
        interval: 7000
        triggeredOnStart: true
        running: true
        repeat: true
        onTriggered: {
            rainEmitter.burst(50, 6500, emitterPos);
        }
    }

}


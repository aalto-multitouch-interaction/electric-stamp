#include "ofxiOS.h"
#include "particle.h"

#include "emitter.h"

void Particle::update() {
    if (!isAlive()) {
        return;
    }

    if (position.x < -radius) {
        position.x = ofGetWidth() + radius;
    } else if (position.x > ofGetWidth() + radius) {
        position.x = -radius;
    }
    if (position.y < -radius) {
        position.y = ofGetHeight() + radius;
    } else if (position.y > ofGetHeight() + radius) {
        position.y = -radius;
    }

    position += velocity;
    life -= decay;
}

void Particle::render() {
    if (isAlive()) {
        ofSetColor(emitter->color.r, emitter->color.g, emitter->color.b, (int)(life * emitter->life * 255));
        ofDrawCircle(position, radius);
    }
}

bool Particle::isAlive() {
    return life > 0;
}

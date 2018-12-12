#include "ofxiOS.h"
#include "particle.h"

void Particle::update() {
    if (!isAlive()) {
        return;
    }

    position += velocity;
    life -= decay;

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
}

void Particle::render() {
    if (isAlive()) {
        ofSetColor(255, (int)(life * 255));
        ofDrawCircle(position, radius);
    }
}

bool Particle::isAlive() {
    return life > 0;
}

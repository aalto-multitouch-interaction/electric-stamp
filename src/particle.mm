#include "ofxiOS.h"
#include "particle.h"

void Particle::update() {
    position += velocity;

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
    ofDrawCircle(position, radius);
}

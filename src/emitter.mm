#include "emitter.h"

Emitter::Emitter(float x, float y, int maxParticles) {
    position.set(x, y);
    particles.reserve(maxParticles);

    for (int i = 0; i < maxParticles; i++) {
        particles.push_back(Particle(
            position.x, position.y,
            ofRandomf() * 2, ofRandomf() * 2,
            ofMap(ofRandomf(), -1, 1, 0.01, 0.05),
            10));
    }
}

void Emitter::update() {
    for (int i = 0; i < particles.size(); i++) {
        Particle *particle = &particles[i];
        particle->update();
        if (!particle->isAlive()) {
            particle->position.set(position);
            particle->velocity.set(ofRandomf() * 2, ofRandomf() * 2);
            particle->decay = ofMap(ofRandomf(), -1, 1, 0.01, 0.05);
            particle->life = 1;
        }
    }
}

void Emitter::render() {
    ofSetColor(255);
    ofDrawCircle(position, 20);
    for (int i = 0; i < particles.size(); i++) {
        particles[i].render();
    }
}

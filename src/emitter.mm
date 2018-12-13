#include "emitter.h"

Emitter::Emitter(float x, float y, int maxParticles, int r) {
    position.set(x, y);
    radius = r;
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
            float angle = ofRandomuf() * PI * 2;
            ofVec2f pos(cos(angle) * radius, sin(angle) * radius);
            particle->position.set(position.x + pos.x, position.y + pos.y);
            particle->velocity.set(ofRandomf() * 2, ofRandomf() * 2);
            particle->decay = ofMap(ofRandomf(), -1, 1, 0.01, 0.05);
            particle->life = 1;
        }
    }
}

void Emitter::render() {
    ofSetColor(255);
    for (int i = 0; i < particles.size(); i++) {
        particles[i].render();
    }
}

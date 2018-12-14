#include "emitter.h"
#include "config.h"

Emitter::Emitter(float x, float y, int maxParticles, int r, ofColor c) {
    position.set(x, y);
    radius = r;
    color = c;
    life = 1;
    active = true;
    decay = Config::EMITTER_DECAY;
    particles.reserve(maxParticles);

    for (int i = 0; i < maxParticles; i++) {
        float angle = ofRandomuf() * PI * 2;
        ofVec2f pos(cos(angle) * radius, sin(angle) * radius);

        particles.push_back(Particle(
            position.x + pos.x, position.y + pos.y,
            ofMap(ofRandomf(), -1, 1, Config::PARTICLE_VELOCITY_MIN, Config::PARTICLE_VELOCITY_MAX),
            ofMap(ofRandomf(), -1, 1, Config::PARTICLE_VELOCITY_MIN, Config::PARTICLE_VELOCITY_MAX),
            ofMap(ofRandomf(), -1, 1, Config::PARTICLE_DECAY_MIN, Config::PARTICLE_DECAY_MAX),
            10,
            this));
    }
}

void Emitter::update() {
    if (!isAlive()) {
        return;
    }

    for (int i = 0; i < particles.size(); i++) {
        Particle *particle = &particles[i];
        particle->update();

        if (!particle->isAlive()) {
            float angle = ofRandomuf() * PI * 2;
            ofVec2f pos(cos(angle) * radius, sin(angle) * radius);
            particle->position.set(position.x + pos.x, position.y + pos.y);
            ofMap(ofRandomf(), -1, 1, Config::PARTICLE_VELOCITY_MIN, Config::PARTICLE_VELOCITY_MAX),
            ofMap(ofRandomf(), -1, 1, Config::PARTICLE_VELOCITY_MIN, Config::PARTICLE_VELOCITY_MAX),
            particle->decay = ofMap(ofRandomf(), -1, 1, Config::PARTICLE_DECAY_MIN, Config::PARTICLE_DECAY_MAX);
            particle->life = 1;
        }
    }

    if (!active) {
        life -= decay;
    }
}

void Emitter::render() {
    if (isAlive()) {
        for (int i = 0; i < particles.size(); i++) {
            particles[i].render();
        }
    }
}

bool Emitter::isAlive() {
    return life > 0;
}

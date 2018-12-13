#ifndef EMITTER_H
#define EMITTER_H

#include <ofxiOS.h>
#include "particle.h"

class Emitter {
    ofVec2f position;
    vector<Particle> particles;

public:
    Emitter(float x, float y, int maxParticles);
    void update();
    void render();
};

#endif

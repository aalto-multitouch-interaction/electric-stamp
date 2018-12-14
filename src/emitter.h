#ifndef EMITTER_H
#define EMITTER_H

#include <ofxiOS.h>
#include "particle.h"

class Emitter {
    ofVec2f position;
    int radius;
    vector<Particle> particles;
    float decay;
    
public:
    Emitter(float x, float y, int maxParticles, int radius, ofColor color);
    void update();
    void render();
    bool isAlive();

    float life;
    bool active;
    ofColor color;
};

#endif

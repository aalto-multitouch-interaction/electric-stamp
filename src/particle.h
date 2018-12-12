#ifndef PARTICLE_H
#define PARTICLE_H

class Particle {
    const float radius, decay;
    ofVec2f position, velocity;
    float life;

public:
    Particle(float xPos, float yPos, float xVel, float yVel, float decay, float radius) :
        position(xPos, yPos),
        velocity(xVel, yVel),
        radius(radius),
        life(1.0),
        decay(decay) {}

    void update();
    void render();
    bool isAlive();
};

#endif

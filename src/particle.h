#ifndef PARTICLE_H
#define PARTICLE_H

class Particle {
    float radius;
    ofVec2f position, velocity;

public:
    Particle(float xPos, float yPos, float xVel, float yVel, float radius) :
        position(xPos, yPos),
        velocity(xVel, yVel),
        radius(radius) {}

    void update();
    void render();
};

#endif

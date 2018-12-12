#ifndef PARTICLE_H
#define PARTICLE_H

class Particle {
public:
    Particle(float xPos, float yPos, float xVel, float yVel) :
        position(xPos, yPos),
        velocity(xVel, yVel) {}

    ofVec2f position, velocity;
};

#endif

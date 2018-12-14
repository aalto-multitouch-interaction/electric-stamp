#ifndef PARTICLE_H
#define PARTICLE_H

class Emitter;

class Particle {
public:
    float radius, decay, life;
    ofVec2f position, velocity;
    Emitter *emitter;

public:
    Particle(float xPos, float yPos, float xVel, float yVel, float decay, float radius, Emitter *emitter) :
        emitter(emitter),
        position(xPos, yPos),
        velocity(xVel, yVel),
        radius(radius),
        life(1),
        decay(decay) {}

    void update();
    void render();
    bool isAlive();
};

#endif

#ifndef CONFIG_H
#define CONFIG_H

static struct Config {
    static constexpr float PARTICLE_DECAY_MIN = 0.01;
    static constexpr float PARTICLE_DECAY_MAX = 0.05;
    static constexpr float PARTICLE_VELOCITY_MIN = -2;
    static constexpr float PARTICLE_VELOCITY_MAX = 2;
    static constexpr float EMITTER_DECAY = 0.01;
} Config;

#endif

#pragma once

#include "ofxiOS.h"
#include "emitter.h"

class ofApp : public ofxiOSApp {
    struct Object;

    struct Finger {
        int id;
        Object *object;
        ofVec2f position;
    };

    struct Object {
        Finger *fingers[3];
        Emitter *emitter;
        ofVec2f position;
    };

    static const int maxFingers = 9;
    Finger fingers[maxFingers];
    vector<Emitter*> emitters;
    vector<Object*> objects;

    public:
        void setup();
        void update();
        void draw();
        void exit();
	
        void touchDown(ofTouchEventArgs & touch);
        void touchMoved(ofTouchEventArgs & touch);
        void touchUp(ofTouchEventArgs & touch);
        void touchDoubleTap(ofTouchEventArgs & touch);
        void touchCancelled(ofTouchEventArgs & touch);

        void lostFocus();
        void gotFocus();
        void gotMemoryWarning();
        void deviceOrientationChanged(int newOrientation);
};

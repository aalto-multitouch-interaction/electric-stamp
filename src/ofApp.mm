#include "ofApp.h"

//--------------------------------------------------------------
void ofApp::setup(){
    ofBackground(0);
    for (int i = 0; i < maxFingers; i++) {
        fingers[i].id = -1;
        fingers[i].object = 0;
    }
}

//--------------------------------------------------------------
void ofApp::update(){
    for (int i = 0; i < emitters.size(); i++) {
        emitters[i]->update();
    }
}

//--------------------------------------------------------------
void ofApp::draw(){
    for (int i = 0; i < emitters.size(); i++) {
        emitters[i]->render();
    }
}

//--------------------------------------------------------------
void ofApp::exit(){

}

//--------------------------------------------------------------
void ofApp::touchDown(ofTouchEventArgs & touch){
    Finger *finger = &fingers[touch.id];
    finger->id = touch.id;
    finger->position.set(touch.x, touch.y);

    vector<Finger*> unassigned;
    for (int i = 0; i < maxFingers; i++) {
        if (fingers[i].id != -1 && !fingers[i].object) {
            unassigned.push_back(&fingers[i]);
        }
    }

    if (unassigned.size() > 2) {
        Finger *first = unassigned.at(0);
        Finger *second = unassigned.at(1);

        Object *object = new Object();
        object->fingers[0] = first;
        object->fingers[1] = second;
        object->fingers[2] = &fingers[touch.id];

        first->object = object;
        second->object = object;
        fingers[touch.id].object = object;

        ofVec2f positions[3];
        positions[0] = first->position;
        positions[1] = second->position;
        positions[2] = finger->position;
        ofVec2f center;
        center.average(positions, 3);

        float rad = first->position.distance(finger->position);

        object->position.set(center);
        Emitter *emitter = new Emitter(center.x, center.y, 1000, rad);
        emitters.push_back(emitter);
        object->emitter = emitter;
        objects.push_back(object);
    }

    cout << "unassigned: " << unassigned.size() << endl;
    cout << "objects: " << objects.size() << endl;
}

//--------------------------------------------------------------
void ofApp::touchMoved(ofTouchEventArgs & touch){

}

//--------------------------------------------------------------
void ofApp::touchUp(ofTouchEventArgs & touch){
    fingers[touch.id].id = -1;

    if (fingers[touch.id].object) {
        cout << "removing assigned!" << endl;
        fingers[touch.id].object = 0;
    }

    cout << "objects: " << objects.size() << endl;
}

//--------------------------------------------------------------
void ofApp::touchDoubleTap(ofTouchEventArgs & touch){

}

//--------------------------------------------------------------
void ofApp::touchCancelled(ofTouchEventArgs & touch){
    
}

//--------------------------------------------------------------
void ofApp::lostFocus(){

}

//--------------------------------------------------------------
void ofApp::gotFocus(){

}

//--------------------------------------------------------------
void ofApp::gotMemoryWarning(){

}

//--------------------------------------------------------------
void ofApp::deviceOrientationChanged(int newOrientation){

}

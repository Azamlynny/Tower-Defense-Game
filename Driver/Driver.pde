import java.util.*; // for ArrayList and list
import java.io.*; // for Calendar

Map Map = new Map();
MouseManager MManage = new MouseManager();
GameTracker Game = new GameTracker();
GUI gui = new GUI();

void setup(){
   //size(1960, 1000, P2D); // P2D uses OpenGL's faster rendering system
   
   fullScreen();
   frameRate(60);
   smooth(3); // Reduce anti-aliasing for better FPS
   rectMode(CENTER); // Centers rectangles around (x,y) position
}

void draw(){
  Map.drawMap();
  Game.gameTick();
  
  gui.drawGUI(Game);
}

void mousePressed(){
    if(mouseButton == 37){ // Left click
        MManage.leftClick(Map);
    }
}

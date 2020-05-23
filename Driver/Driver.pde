
Map Map = new Map();

void setup(){
   //size(1960, 1000, P2D); // P2D uses OpenGL's faster rendering system
   
   fullScreen();
   frameRate(60);
   smooth(3); // Reduce anti-aliasing for better FPS
   rectMode(CENTER); // Centers rectangles around (x,y) position
}

void draw(){
  Map.drawMap();
}

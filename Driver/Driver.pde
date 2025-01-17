      // Driver
      
      import java.util.*; // for ArrayList and list
      import java.io.*; // for Calendar
      
      Map Map = new Map();
      MouseManager MManage = new MouseManager();
      GameTracker Game = new GameTracker(Map);
      GUI gui = new GUI();
      
      void setup(){   
         fullScreen(P2D); // P2D uses OpenGL's faster rendering system
         frameRate(60);
         smooth(3); // Reduce anti-aliasing for better FPS
         rectMode(CENTER); // Centers rectangles around (x,y) position
      }
      
      void draw(){
        Map.drawMap();
        Game.gameTick(Map);
        gui.drawGUI(Game, MManage);
      }
      
      void mousePressed(){
          if(mouseButton == 37){ // Left click
              MManage.leftClick(Map, Game);
          }
      }

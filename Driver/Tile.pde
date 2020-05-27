      // Tile
      
      class Tile {
      
        int xPos;
        int yPos;
        int tileWidth;
        int number; 
        String type;
        
        public Tile (Map map, int num, int x, int y) {
          this.tileWidth = map.tileWidth;
          number = num; // Used to differentiate between tiles of the same typeritization by towers
          xPos = (x * tileWidth) + tileWidth/2;
          yPos = (y * tileWidth) + tileWidth/2;
          type = "empty";
        }
        
        void drawTile(){
          // Empty tiles do not draw anything. Path inherits tile and draws a grey path tile. 
        }
        
      }

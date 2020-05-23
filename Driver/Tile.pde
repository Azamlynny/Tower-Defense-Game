class Tile {

  int xPos;
  int yPos;
  int tileWidth;
  int number; 
  
  public Tile (Map map, int num, int x, int y) {
    this.tileWidth = map.tileWidth;
    number = num; // Used to differentiate between tiles of the same type
    xPos = (x * tileWidth) + tileWidth/2;
    yPos = (y * tileWidth) + tileWidth/2;
  }
 
  void drawTile(){
    //rect(xPos, yPos, tileWidth, tileWidth);
  }
  
}

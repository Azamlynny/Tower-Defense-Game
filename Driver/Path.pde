// Path

class Path extends Tile {


  public Path (Map map, int num, int x, int y) {
    super(map, num, x, y);
    type = "path";
  }
 
  void drawTile(){
    fill(145, 148, 139); // gray
    rect(xPos, yPos, tileWidth - 10, tileWidth - 10);
  }
  
}

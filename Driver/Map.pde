class Map {

  int mapWidth = 1960; // Screen resolution width
  int mapHeight = 1080; // Screen resolution height
  int tileWidth = 80; // Width of each tile
  
  public Map() {

  }
 
  void drawMap(){
    drawGrid();
  }
  
  void drawGrid(){ // Draws a grid to show tile on the map
    background(156, 135, 75); // light brown
    strokeWeight(0); 
    stroke(50); 
    for(int i = 0; i < (mapWidth/tileWidth); i++){
      line(i * tileWidth, 0, i * tileWidth, mapHeight);
    }
    for(int i = 0; i < (mapHeight/tileWidth); i++){
      line(0, i * tileWidth, mapWidth, i * tileWidth);
    }
  }
  
}

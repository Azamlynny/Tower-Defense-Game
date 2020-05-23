class Map {

  int mapWidth = 1960; // Screen resolution width
  int mapHeight = 1080; // Screen resolution height
  int tileWidth = 80; // Width of each tile
  int xTiles = mapWidth/tileWidth;
  int yTiles = mapHeight/tileWidth;
  Tile[][] tiles = new Tile[xTiles][yTiles];

  public Map() {
    createEnemyPath();
  }
 
  void drawMap(){
    drawGrid();
    for(int y = 0; y < tiles[0].length; y++){
      for(int x = 0; x < tiles.length; x++){
        tiles[x][y].drawTile();
      }
    }
  }
  
  void drawGrid(){ // Draws a grid to show tile on the map
    background(156, 135, 75); // light brown
    strokeWeight(0); 
    stroke(50); 
    for(int i = 0; i < xTiles; i++){
      line(i * tileWidth, 0, i * tileWidth, mapHeight);
    }
    for(int i = 0; i < yTiles; i++){
      line(0, i * tileWidth, mapWidth, i * tileWidth);
    }
  }
  
  void createEnemyPath(){
    int counter = 0;
    for(int y = 0; y < tiles[0].length; y++){
      for(int x = 0; x < tiles.length; x++){
        if(tiles[x][y] == null){
          tiles[x][y] = new Tile(this, counter, x, y);
          counter++;
        }
      }
    }
  }
  
}

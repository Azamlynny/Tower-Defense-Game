class Map {

  int mapWidth = 1960; // Screen resolution width
  int mapHeight = 1080; // Screen resolution height
  int tileWidth = 80; // Width of each tile
  int xTiles = mapWidth/tileWidth;
  int yTiles = mapHeight/tileWidth;
  Tile[][] tiles = new Tile[xTiles][yTiles];
  int endOfPath;

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
    
    // Create a path for enemies to traverse
    counter = addPath(3,0,counter);
    counter = addPath(3,1,counter);
    counter = addPath(3,2,counter);
    counter = addPath(3,3,counter);
    counter = addPath(3,4,counter);
    counter = addPath(2,4,counter);
    counter = addPath(2,5,counter);
    counter = addPath(2,6,counter);
    counter = addPath(2,7,counter);
    counter = addPath(2,8,counter);
    counter = addPath(3,8,counter);
    counter = addPath(4,8,counter);
    counter = addPath(5,8,counter);
    counter = addPath(6,8,counter);
    counter = addPath(6,7,counter);
    counter = addPath(6,6,counter);
    counter = addPath(5,6,counter);
    counter = addPath(5,5,counter);
    counter = addPath(5,4,counter);
    counter = addPath(5,3,counter);
    counter = addPath(5,2,counter);
    counter = addPath(5,1,counter);
    counter = addPath(6,1,counter);
    counter = addPath(7,1,counter);
    counter = addPath(8,1,counter);
    counter = addPath(9,1,counter);
    counter = addPath(9,2,counter);
    counter = addPath(9,3,counter);
    counter = addPath(9,4,counter);
    counter = addPath(9,5,counter);
    counter = addPath(10,5,counter);
    counter = addPath(11,5,counter);
    counter = addPath(11,4,counter);
    counter = addPath(11,3,counter);
    counter = addPath(11,2,counter);
    counter = addPath(12,2,counter);
    counter = addPath(13,2,counter);
    counter = addPath(14,2,counter);
    counter = addPath(14,3,counter);
    counter = addPath(14,4,counter);
    counter = addPath(14,5,counter);
    counter = addPath(14,6,counter);
    counter = addPath(14,7,counter);
    counter = addPath(13,7,counter);
    counter = addPath(12,7,counter);
    counter = addPath(11,7,counter);
    counter = addPath(10,7,counter);
    counter = addPath(10,8,counter);
    counter = addPath(10,9,counter);
    counter = addPath(11,9,counter);
    counter = addPath(12,9,counter);
    counter = addPath(13,9,counter);
    counter = addPath(14,9,counter);
    counter = addPath(15,9,counter);
    counter = addPath(16,9,counter);
    counter = addPath(16,8,counter);
    counter = addPath(17,8,counter);
    counter = addPath(18,8,counter);
    counter = addPath(18,7,counter);
    counter = addPath(18,6,counter);
    counter = addPath(18,5,counter);
    counter = addPath(19,5,counter);
    counter = addPath(19,4,counter);
    counter = addPath(19,3,counter);
    counter = addPath(19,2,counter);
    counter = addPath(20,2,counter);
    counter = addPath(21,2,counter);
    counter = addPath(22,2,counter);
    counter = addPath(23,2,counter);
    this.endOfPath = counter; // Save the end of the enemy path for pathfinding purposes
    
    for(int y = 0; y < tiles[0].length; y++){ // Fills the rest of the unfilled tiles with empty tiles
      for(int x = 0; x < tiles.length; x++){
        if(tiles[x][y] == null){
          tiles[x][y] = new Tile(this, counter, x, y);
          counter++;
        }
      }
    }
  }
  
  int addPath(int x, int y, int counter){ // Make a tile on x,y in tiles[][] a path tile
    tiles[x][y] = new Path(this, counter, x, y);
    counter++;
    return counter;
  } 
  
}

class Map {

  int mapWidth = 1960; // Screen resolution width
  int mapHeight = 1080; // Screen resolution height
  int tileWidth = 80; // Width of each tile
  int xTiles = mapWidth/tileWidth;
  int yTiles = mapHeight/tileWidth;
  Tile[][] tiles = new Tile[xTiles][yTiles];
  int[][] pathTiles =  { {3,0}, {3,1}, {3,2}, {3,3}, {3,4}, {2,4}, {2,5}, {2,6}, {2,7}, {2,8}, {3,8}, {4,8}, {5,8}, {6,8}, {6,7}, {6,6}, {5,6}, {5,5}, {5,4}, {5,3}, {5,2}, {5,1}, {6,1}, {7,1}, {8,1}, {9,1}, {9,2}, {9,3}, {9,4}, {9,5}, {10,5}, {11,5}, {11,4}, {11,3}, {11,2}, {12,2}, {13,2}, {14,2}, {14,3}, {14,4}, {14,5}, {14,6}, {14,7}, {13,7}, {12,7}, {11,7}, {10,7}, {10,8}, {10,9}, {11,9}, {12,9}, {13,9}, {14,9}, {15,9}, {16,9}, {16,9}, {16,8}, {17,8}, {18,8}, {18,7}, {18,6}, {18,5}, {19,5}, {19,4}, {19,3}, {19,2}, {20,2}, {21,2}, {22,2}, {23,2} };
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
    for(int i = 0; i < 70; i++){
      counter = addPath(pathTiles[i][0], pathTiles[i][1], counter); 
    }
    
    this.endOfPath = counter; // Save the end of the enemy path for pathfinding purposes
    print(endOfPath);
    
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

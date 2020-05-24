class Enemy {
  int health; 
  int speed;
  int armor;
  int damage;
  int xPos;
  int yPos;
  int enemySize;
  int goal;
  int moneyDropped; // How much money the enemy drops upon being killed
  
  public Enemy(int hp, int spd, int arm, int dmg, int enemyWidth, int moneyDrop, Map Map) {
    health = hp;
    speed = spd;
    armor = arm;
    damage = dmg;
    xPos = Map.pathTiles[0][0] * Map.tileWidth + Map.tileWidth/2;
    yPos = Map.pathTiles[0][1] * Map.tileWidth + Map.tileWidth/2;
    enemySize = enemyWidth;
    goal = 1;
    moneyDropped = moneyDrop;
  }
  
  void move(Map Map, GameTracker Game){
    int goalX = Map.pathTiles[goal][0] * Map.tileWidth + Map.tileWidth/2;
    int goalY = Map.pathTiles[goal][1] * Map.tileWidth + Map.tileWidth/2;
    if(checkDistanceToGoal(goalX, goalY) <= 10){ // If the tile is reached, move to the next one
      if(goal == Map.endOfPath - 1){ // Check if the enemy is at the end of the path
        // deal damage to the player's hearts and remove the enemy
        Game.hearts -= damage;
        this.health = 0;
        Game.ETracker.enemyList.remove(this);
      }
      else{
        goal++;
        this.move(Map, Game); // Move again once the goal is reached so that the enemies do not stop and pause
      }
    }
    
    // Move towards the goal
    if(goalX > xPos){
      xPos += speed/10;
    }
    if(goalX < xPos){
      xPos -= speed/10;
    }
    if(goalY > yPos){
      yPos += speed/10;
    }
    if(goalY < yPos){
      yPos -= speed/10;
    }
  }
  
  void drawEnemy(){
    fill(0);
    rect(xPos, yPos, enemySize, enemySize); 
  }
  
  double checkDistanceToGoal(int goalX, int goalY){
    return (Math.pow(goalX - xPos, 2) + Math.pow(goalY - yPos, 2));
  }
  
}

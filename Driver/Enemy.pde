class Enemy {
  
  String type; // enemy type: can be basic, quick, tank, boss
  int health;
  int maxHealth;
  int speed;
  int damage;
  int xPos;
  int yPos;
  int enemySize;
  int goal;
  int moneyDropped; // How much money the enemy drops upon being killed
  
  public Enemy(String enemyType, Map Map) {
    type = enemyType;
    if(type.equals("basic")){
      health = 4;
      //speed = 25;
      //damage = 2;
      speed = 100;
      damage = 50;
      enemySize = 40;
      moneyDropped = 10; 
    }
    else if(type.equals("quick")){
      health = 2;
      speed = 45;
      damage = 1;
      enemySize = 30;
      moneyDropped = 20; 
    }
    else if(type.equals("tank")){
      health = 15;
      speed = 15;
      damage = 5;
      enemySize = 50;
      moneyDropped = 50; 
    }
    else if(type.equals("boss")){
      health = 200;
      speed = 10;
      damage = 40;
      enemySize = 70;
      moneyDropped = 500; 
    }

    maxHealth = health;
    goal = 1;
    xPos = Map.pathTiles[0][0] * Map.tileWidth + Map.tileWidth/2;
    yPos = Map.pathTiles[0][1] * Map.tileWidth + Map.tileWidth/2;
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
    
    if(type.equals("basic")){
      fill(122, 255, 142);
      rect(xPos, yPos, enemySize, enemySize); 
    }
    else if(type.equals("quick")){
      fill(242, 224, 61);
      rect(xPos, yPos, enemySize, enemySize); 
    }
    else if(type.equals("tank")){
      fill(8, 3, 153);
      rect(xPos, yPos, enemySize, enemySize); 
    }
    else if(type.equals("boss")){
      fill(255, 0, 0);
      rect(xPos, yPos, enemySize, enemySize); 
    }
    
    drawHealthBar();
  }
  
  void drawHealthBar(){
    fill(212);
    rect(xPos, yPos - (enemySize/2) - 20, enemySize, 10);
    fill(8, 230, 0);
    rectMode(CORNER);
    rect(xPos - enemySize / 2, yPos - (enemySize/2) - 25, (int) enemySize * ((float) health/ (float) maxHealth), 10);
    rectMode(CENTER);
  }
  
  double checkDistanceToGoal(int goalX, int goalY){
    return (Math.pow(goalX - xPos, 2) + Math.pow(goalY - yPos, 2));
  }
  
}

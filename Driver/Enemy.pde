class Enemy {
  int health; 
  int speed;
  int armor;
  int damage;
  int xPos;
  int yPos;
  int enemySize;
  int goal;
  
  public Enemy(int hp, int spd, int arm, int dmg, int enemyWidth, Map Map) {
    health = hp;
    speed = spd;
    armor = arm;
    damage = dmg;
    xPos = Map.pathTiles[0][0] * Map.tileWidth + Map.tileWidth/2;
    yPos = Map.pathTiles[0][1] * Map.tileWidth + Map.tileWidth/2;
    enemySize = enemyWidth;
    goal = 1;
  }
  
  void move(Map Map){
    
  }
  
  void drawEnemy(){
    fill(0);
    rect(xPos, yPos, enemySize, enemySize); 
  }
  
}

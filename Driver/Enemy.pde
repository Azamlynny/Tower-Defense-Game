class Enemy {
  int health; 
  int speed;
  int armor;
  int damage;
  int xPos;
  int yPos;
  int enemySize;
  
  public Enemy(int hp, int spd, int arm, int dmg, int xPosition, int yPosition, int enemyWidth) {
    health = hp;
    speed = spd;
    armor = arm;
    damage = dmg;
    xPos = xPosition;
    yPos = yPosition;
    enemySize = enemyWidth;
  }
  
  void move(Map Map){
    
  }
  
  void drawEnemy(){
    fill(0);
    rect(xPos, yPos, enemySize, enemySize); 
  }
  
}

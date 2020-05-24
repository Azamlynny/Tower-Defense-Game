class Projectile {
  float xPos;
  float yPos;
  float xVel; // x velocity
  float yVel; // y velocity
  int damage; // Damage the projcetile inflicts on the enemy
  
  public Projectile(float xPosition, float yPosition, float xVelocity, float yVelocity, int dmg) {
    xPos = xPosition;
    yPos = yPosition;
    xVel = xVelocity;
    yVel = yVelocity;
    damage = dmg;
  }
  
  void moveProjectile(GameTracker Game){
    xPos += xVel;
    yPos += yVel;
    checkCollision(Game);
  }
  
  void checkCollision(GameTracker Game){
    for(int i = 0; i < Game.enemyList.size(); i++){
      if(checkDistance(Game.enemyList.get(i).xPos, Game.enemyList.get(i).yPos) < 10){
        Game.enemyList.get(i).health -= this.damage; 
      }
    }
  }
  
  double checkDistance(int targetX, int targetY){
    return (Math.pow(targetX - xPos, 2) + Math.pow(targetY - yPos, 2));
  }
   
}

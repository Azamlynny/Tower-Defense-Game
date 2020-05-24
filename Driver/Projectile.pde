class Projectile {
  float xPos;
  float yPos;
  float xVel; // x velocity
  float yVel; // y velocity
  int projectileWidth;
  int damage; // Damage the projcetile inflicts on the enemy
  int collisionTolerance = 100;
  
  public Projectile(float xPosition, float yPosition, float xVelocity, float yVelocity, int dmg, int projWidth) {
    xPos = xPosition;
    yPos = yPosition;
    xVel = xVelocity;
    yVel = yVelocity;
    damage = dmg;
    projectileWidth = projWidth;
  }
  
  void drawProjectile(){
    fill(0);
    ellipse(xPos, yPos, projectileWidth, projectileWidth);
  }
  
  void moveProjectile(GameTracker Game){
    xPos += xVel;
    yPos += yVel;
    checkCollision(Game);
  }
  
  void checkCollision(GameTracker Game){
    for(int i = 0; i < Game.enemyList.size(); i++){
      if(checkDistance(Game.enemyList.get(i).xPos, Game.enemyList.get(i).yPos) < collisionTolerance){
        Game.enemyList.get(i).health -= this.damage; 
        Game.PTracker.projectileList.remove(this); // Deletes the instance of the projectile after colliding with an enemy and dealing damage
      }
    }
  }
  
  double checkDistance(int targetX, int targetY){
    return (Math.pow(targetX - xPos, 2) + Math.pow(targetY - yPos, 2));
  }
   
}

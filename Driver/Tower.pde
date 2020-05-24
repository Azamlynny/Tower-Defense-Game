class Tower {

  int projectileSpeed;
  int projectileSize;
  int range;
  int damage;
  int cost;
  int cooldown; // cooldown between projectiles fired measured in milliseconds (ms)
  int xPos;
  int yPos;
  int xCoord;
  int yCoord;
  int towerWidth;
  long timeSinceLastFired;
  Enemy Target;
  
  public Tower(int xCoordinate, int yCoordinate, int towerRange, int towerSize, Map Map){
    xCoord = xCoordinate;
    yCoord = yCoordinate;
    xPos = xCoordinate * Map.tileWidth + Map.tileWidth/2;
    yPos = yCoordinate * Map.tileWidth + Map.tileWidth/2;
    towerWidth = towerSize;
    range = towerRange;
  }
  
  void drawTower(){
    fill(0,240,0);
    rect(xPos, yPos, towerWidth, towerWidth);
  }
  
  void checkCooldown(GameTracker Game){
    long currentTime = System.currentTimeMillis();
    long timeElapsed = currentTime - timeSinceLastFired;
    if(timeElapsed > cooldown){
      fireProjectile(Game); 
    }
  }
  
  void fireProjectile(GameTracker Game){
    timeSinceLastFired = System.currentTimeMillis();
    if(Target.health > 0){
      int targetX = Target.xPos;
      int targetY = Target.yPos;
      float xVel = (Target.xPos / Target.yPos) * projectileSpeed;
      float yVel = (Target.yPos / Target.xPos) * projectileSpeed;
      Game.PTracker.projectileList.add(new Projectile(this.xPos, this.yPos, xVel, yVel, damage, projectileSize));
    }
    else{
      findNewTarget(Game); 
    }
  }
  
  void findNewTarget(GameTracker Game){ // Targets the enemy which is the farthest down the path and closest to the end
    Enemy tempTarget;
    int highestEnemyGoal = 0; // Used to determine which enemy is the farthest ahead to target the first enemy
    for(int i = 0; i < Game.enemyList.size(); i++){
      if(checkDistance(Game.enemyList.get(i).xPos, Game.enemyList.get(i).yPos) <= Math.pow(range,2)){ // Check whether the target is within the tower's range
        tempTarget = Game.enemyList.get(i);
        if(tempTarget.goal > highestEnemyGoal){
          highestEnemyGoal = tempTarget.goal; // The enemy who has the greater tile goal is further down the path
          Target = tempTarget; 
        }
      }
    }
    
    fireProjectile(Game); // Once a new target is found immediately fire another projectile to prevent delay
  }
  
  double checkDistance(int targetX, int targetY){
    return (Math.pow(targetX - xPos, 2) + Math.pow(targetY - yPos, 2));
  }
  
}

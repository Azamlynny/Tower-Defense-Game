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
  
  public Tower(int xCoordinate, int yCoordinate, int towerRange, int towerCooldown, int towerDamage, int towerCost, int towerSize, int towerProjectileSize, int towerProjectileSpeed, Map Map){
    xCoord = xCoordinate;
    yCoord = yCoordinate;
    xPos = xCoordinate * Map.tileWidth + Map.tileWidth/2;
    yPos = yCoordinate * Map.tileWidth + Map.tileWidth/2;
    towerWidth = towerSize;
    range = towerRange;
    cooldown = towerCooldown;    
    timeSinceLastFired = System.currentTimeMillis();  
    projectileSize = towerProjectileSize;
    projectileSpeed = towerProjectileSpeed;
    damage = towerDamage;
    cost = towerCost;
  }
  
  void drawTower(){
    fill(0,240,0);
    rect(xPos, yPos, towerWidth, towerWidth);
    stroke(0);
    strokeWeight(0);
    noFill();
    ellipse(xPos, yPos, range, range);
  }
  
  void checkCooldown(GameTracker Game){
    if(Target != null && Target.health > 0 && checkDistance(Target.xPos, Target.yPos) <= Math.pow((range/2),2)){ // Check if the target exists, is alive, and is within the tower range
      long currentTime = System.currentTimeMillis();
      long timeElapsed = currentTime - timeSinceLastFired;
      if(timeElapsed >= cooldown){
        fireProjectile(Game); 
      }
    }
    else{
      findNewTarget(Game);  
    }
  }
  
  void fireProjectile(GameTracker Game){
    timeSinceLastFired = System.currentTimeMillis();
    System.out.println("fired");
    int targetX = Target.xPos;
    int targetY = Target.yPos;
    double distanceToTarget = Math.pow(checkDistance(targetX, targetY),0.5);
    float timeToTarget = (float) distanceToTarget / projectileSpeed;
    float xVel = (Target.xPos - xPos) / timeToTarget;
    float yVel = (Target.yPos - yPos) / timeToTarget;
    Game.PTracker.projectileList.add(new Projectile(this.xPos, this.yPos, xVel, yVel, damage, projectileSize));
    System.out.println("Spawned a projectile");
  }
  
  void findNewTarget(GameTracker Game){ // Targets the enemy which is the farthest down the path and closest to the end
    Enemy tempTarget;
    int highestEnemyGoal = 0; // Used to determine which enemy is the farthest ahead to target the first enemy
    for(int i = 0; i < Game.enemyList.size(); i++){
      if(checkDistance(Game.enemyList.get(i).xPos, Game.enemyList.get(i).yPos) <= Math.pow((range/2),2)){ // Check whether the target is within the tower's range
        tempTarget = Game.enemyList.get(i);
        if(tempTarget.goal > highestEnemyGoal){
          highestEnemyGoal = tempTarget.goal; // The enemy who has the greater tile goal is further down the path
          Target = tempTarget; 
        }
      }
    }
    
  }
  
  double checkDistance(int targetX, int targetY){
    return (Math.pow(targetX - xPos, 2) + Math.pow(targetY - yPos, 2));
  }
  
}

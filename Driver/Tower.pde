class Tower {

  String type; // basic, burst, sniper, slow
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
  
  public Tower(int xCoordinate, int yCoordinate, String towerType, Map Map){
    xCoord = xCoordinate;
    yCoord = yCoordinate;
    xPos = xCoordinate * Map.tileWidth + Map.tileWidth/2;
    yPos = yCoordinate * Map.tileWidth + Map.tileWidth/2;
    
    type = towerType;
    
    if(type.equals("basic")){
      towerWidth = 60;
      range = 500;
      cooldown = 3000;    
      projectileSize = 25;
      projectileSpeed = 15;
      damage = 3;
      cost = 250;
    }
    else if(type.equals("burst")){
      towerWidth = 40;
      range = 300;
      cooldown = 500;    
      projectileSize = 10;
      projectileSpeed = 20;
      damage = 1;
      cost = 300;
    }
    else if(type.equals("sniper")){
      towerWidth = 30;
      range = 1000;
      cooldown = 5000;    
      projectileSize = 20;
      projectileSpeed = 45;
      damage = 10;
      cost = 400;
    }
    else if(type.equals("slow")){
      towerWidth = 50;
      range = 600;
      cooldown = 8000;    
      projectileSize = 40;
      projectileSpeed = 10;
      damage = 15;
      cost = 800;
    }
    
    timeSinceLastFired = System.currentTimeMillis();  
  }
  
  void drawTower(){
    if(type.equals("basic")){
      fill(16, 70, 196);
      rect(xPos, yPos, towerWidth, towerWidth);
      noFill();
      strokeWeight(3);
      stroke(145, 176, 250);
      rect(xPos, yPos, towerWidth - 10, towerWidth - 10);
    }
    else if(type.equals("burst")){
      fill(167, 36, 179);
      noStroke();
      rect(xPos, yPos, towerWidth, towerWidth);
    }
    else if(type.equals("sniper")){
      fill(2, 110, 22);
      strokeWeight(3);
      stroke(24, 61, 26);
      triangle(xPos, yPos - towerWidth + 10, xPos - 0.866 * towerWidth, yPos + towerWidth / 2 + 10, xPos + 0.866 * towerWidth, yPos + towerWidth / 2 + 10);
    }
    else if(type.equals("slow")){
      fill(104, 228, 237);
      stroke(109, 188, 194);
      strokeWeight(3);
      ellipse(xPos,yPos, towerWidth, towerWidth);
    }
    
    stroke(100);
    strokeWeight(1);
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
    int targetX = Target.xPos;
    int targetY = Target.yPos;
    double distanceToTarget = Math.pow(checkDistance(targetX, targetY),0.5);
    float timeToTarget = (float) distanceToTarget / projectileSpeed;
    float xVel = (Target.xPos - xPos) / timeToTarget;
    float yVel = (Target.yPos - yPos) / timeToTarget;
    Game.PTracker.projectileList.add(new Projectile(this.xPos, this.yPos, xVel, yVel, damage, projectileSize));
  }
  
  void findNewTarget(GameTracker Game){ // Targets the enemy which is the farthest down the path and closest to the end
    Enemy tempTarget;
    int highestEnemyGoal = 0; // Used to determine which enemy is the farthest ahead to target the first enemy
    for(int i = 0; i < Game.ETracker.enemyList.size(); i++){
      if(checkDistance(Game.ETracker.enemyList.get(i).xPos, Game.ETracker.enemyList.get(i).yPos) <= Math.pow((range/2),2)){ // Check whether the target is within the tower's range
        tempTarget = Game.ETracker.enemyList.get(i);
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

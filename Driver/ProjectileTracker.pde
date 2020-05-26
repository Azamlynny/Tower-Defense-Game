// ProjectileTracker

class ProjectileTracker {
 
  List<Projectile> projectileList = new ArrayList<Projectile>();

  public ProjectileTracker(){
    
  }
  
  void runProjectileActions(GameTracker Game){
    updateProjectiles(Game);
    drawProjectiles();
  }
  
  void updateProjectiles(GameTracker Game){
    for(int i = 0; i < projectileList.size(); i++){
      projectileList.get(i).moveProjectile(Game); 
    }
  }
  
  void drawProjectiles(){
    for(int i = 0; i < projectileList.size(); i++){
      projectileList.get(i).drawProjectile(); 
    }
  }
  
  // Cleanup any projectiles off of the screen to reduce lag
  void discardProjectiles(){
    for(int i = 0; i < projectileList.size(); i++){
      if(projectileList.get(i).xPos > 2100 || projectileList.get(i).xPos < -300 || projectileList.get(i).yPos > 1380 || projectileList.get(i).yPos < -300){
        projectileList.remove(i);
      }
    }
  }
  
}

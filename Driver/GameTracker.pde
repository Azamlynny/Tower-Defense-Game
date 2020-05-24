import java.util.concurrent.TimeUnit;

class GameTracker {

  int money;
  int hearts;
  List<Enemy> enemyList = new ArrayList<Enemy>();
  long timeStart;
  long time;
  WaveTracker WTracker = new WaveTracker();
  ProjectileTracker PTracker = new ProjectileTracker();
  TowerTracker TTracker = new TowerTracker();
  
  public GameTracker(Map Map) {
    money = 500;
    hearts = 50;
    
    // Record the initial time when the game begins for wave spawning
    timeStart = System.currentTimeMillis();
    
    // Test tower
    TTracker.towerList.add(new Tower(4, 5, 500, 3000, 1, 100, 40, 30, 10, Map));
  }
  
  void gameTick(Map Map){ // Iterates the game and all of its elements every frame
    long timeEnd = System.currentTimeMillis();
    time = TimeUnit.MILLISECONDS.toSeconds(timeEnd - timeStart); // Update the game's time counter in seconds
    
    WTracker.checkWaveSpawn(this, Map); // Constantly checks to see if a new wave should be spawned
    WTracker.dequeueSpawnWave(this); // Spawns a wave of enemies over time
    TTracker.runTowerActions(this);
    PTracker.runProjectileActions(this);
    
    for(int i = 0; i < enemyList.size(); i++){
      enemyList.get(i).move(Map, this); 
    }
    
    drawEntities(); // Draws enemies, towers, and projectiles
  }
  
  void drawEntities(){
    for(int i = 0; i < enemyList.size(); i++){
      enemyList.get(i).drawEnemy(); 
      
      if(enemyList.get(i).health <= 0){ // discard dead enemies
        enemyList.remove(i); 
      }
    }
  }
  
}

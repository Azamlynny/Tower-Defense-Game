import java.util.concurrent.TimeUnit;

class GameTracker {

  int money;
  int hearts;
  long timeStart;
  long time;
  WaveTracker WTracker = new WaveTracker();
  ProjectileTracker PTracker = new ProjectileTracker();
  TowerTracker TTracker = new TowerTracker();
  EnemyTracker ETracker = new EnemyTracker();
  
  public GameTracker(Map Map) {
    money = 500;
    hearts = 50;
    
    // Record the initial time when the game begins for wave spawning
    timeStart = System.currentTimeMillis();
  }
  
  void gameTick(Map Map){ // Iterates the game and all of its elements every frame
    updateGameTime();
    
    WTracker.checkWaveSpawn(this, Map); // Constantly checks to see if a new wave should be spawned
    WTracker.dequeueSpawnWave(this); // Spawns a wave of enemies over time
    TTracker.runTowerActions(this);
    PTracker.runProjectileActions(this);
    ETracker.runEnemyActions(this, Map);
    
  }
  
  void updateGameTime(){
    long timeEnd = System.currentTimeMillis();
    time = TimeUnit.MILLISECONDS.toSeconds(timeEnd - timeStart); // Update the game's time counter in seconds
  }
  
}

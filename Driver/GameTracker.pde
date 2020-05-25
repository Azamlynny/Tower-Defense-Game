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
    updateGameTime(); // Used for timing for wave spawning
    
    WTracker.checkWaveSpawn(this, Map); // Constantly checks to see if a new wave should be spawned
    WTracker.dequeueSpawnWave(this); // Spawns a wave of enemies over a period of time
    
    TTracker.runTowerActions(this);
    PTracker.runProjectileActions(this);
    ETracker.runEnemyActions(this, Map);
    
    checkLoss();
    checkVictory();
  }
  
  void updateGameTime(){
    long timeEnd = System.currentTimeMillis();
    time = TimeUnit.MILLISECONDS.toSeconds(timeEnd - timeStart); // Update the game's time counter in seconds
  }
  
  void checkLoss(){
    if(hearts <= 0){
      fill(0);
      textAlign(CENTER);
      textSize(200);
      text("You Lost!", 1960/2, 1080/2);
    }
  }
  
  void checkVictory(){
    if(WTracker.wave == 10 && ETracker.enemyList.size() == 0 && WTracker.spawning == false && hearts > 0){
      fill(0);
      textAlign(CENTER);
      textSize(200);
      text("You Won!", 1960/2, 1080/2);
    }
  }
  
}

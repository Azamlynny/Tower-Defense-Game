class WaveTracker {
  
  int wave;
  boolean spawning;
  long timeSinceLastSpawn; 
  int spacing; // Spacing between enemy spawns
  List<Enemy> enemyQueue = new ArrayList<Enemy>();

  public WaveTracker(){
    wave = 0;
    spawning = false;
  }
  
  void checkWaveSpawn(GameTracker Game){
    // TODO: ADD CHECK TO MAKE SURE NO MORE ENEMIES NEED TO SPAWN
    if(Game.enemyList.size() == 0 && Game.time >= 5){
      beginNewWave(Game);
    }
    
    if(Game.time == 30){
      beginNewWave(Game);
    }
    
  }
  
  void beginNewWave(GameTracker Game){
     wave++;
     spawning = true;
     timeSinceLastSpawn = System.currentTimeMillis();
     spawnWave(Game);
  }
  
  void spawnWave(GameTracker Game){
    if(spawning){
      if(wave == 1){
        spawnWave1(Game);
      }
      
    }
  }
      
      // Enemy(int hp, int spd, int arm, int dmg, int xPosition, int yPosition, int enemyWidth)
  
  void spawnWave1(GameTracker Game){
    spacing = 1000;
    
  }
  
  void dequeueSpawnWave(GameTracker Game){
    if(enemyQueue.size() > 0){
      long currentTime = System.currentTimeMillis();
      if(currentTime - timeSinceLastSpawn >= spacing){
        timeSinceLastSpawn = System.currentTimeMillis();
        
        // Add a new enemy object to the enemies in game  
        Game.enemyList.add(enemyQueue.get(0));
        // Pop the first enemy off the enemy queue
        enemyQueue.remove(0);
      }
    }
  }
}

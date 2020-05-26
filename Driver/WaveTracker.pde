// WaveTracker

class WaveTracker {
  
  int wave;
  boolean spawning;
  long timeSinceLastSpawn; 
  int spacing; // Spacing between enemy spawns
  List<Enemy> enemyQueue = new ArrayList<Enemy>();
  int[] waveTimes = {15, 40, 60, 85, 120, 140, 175, 215, 250, 275, 310};
  
  public WaveTracker(){
    wave = 0;
    spawning = false;
  }
  
  void checkWaveSpawn(GameTracker Game, Map Map){
    if(wave < 10){ // Wave 10 is the final wave
      if(spawning == false){
        for(int i = 0; i < 10; i++){
          if(Game.time == waveTimes[i]){ // Check if a new wave should begin
            beginNewWave(Game, Map); 
          }
        }
      }
    }
  }
  
  void beginNewWave(GameTracker Game, Map Map){
     wave++;
     Game.money += 200; // give the player a free $200 each wave
     spawning = true;
     timeSinceLastSpawn = System.currentTimeMillis();
     spawnWave(Game, Map);
  }
  
  void spawnWave(GameTracker Game, Map Map){
    if(spawning){
      if(wave == 1){
        spawnWave1(Map);
      }
      else if(wave == 2){
        spawnWave2(Map);
      }
      else if(wave == 3){
        spawnWave3(Map);
      }
      else if(wave == 4){
        spawnWave4(Map);
      }
      else if(wave == 5){
        spawnWave5(Map);
      }
      else if(wave == 6){
        spawnWave6(Map);
      }
      else if(wave == 7){
        spawnWave7(Map);
      }
      else if(wave == 8){
        spawnWave8(Map);
      }
      else if(wave == 9){
        spawnWave9(Map);
      }
      else if(wave == 10){
        spawnWave10(Map);
      }
    }
  }
  
  void dequeueSpawnWave(GameTracker Game){
    if(enemyQueue.size() > 0){
      long currentTime = System.currentTimeMillis();
      long timeElapsed = currentTime - timeSinceLastSpawn;
      //System.out.println(timeElapsed + " " + spacing);
      if(timeElapsed >= spacing){
        timeSinceLastSpawn = System.currentTimeMillis();
        
        // Add a new enemy object to the enemies in game  
        Game.ETracker.enemyList.add(enemyQueue.get(0));
        // Pop the first enemy off the enemy queue
        enemyQueue.remove(0);
        if(enemyQueue.size() == 0){
          spawning = false; 
          enemyQueue.clear();
        }
      }
    }
  }
  
  void spawnEnemy(String type, int amount, Map Map){ // Spawns an amount of an enemy
    for(int i = 0; i < amount; i++){
      enemyQueue.add(new Enemy(type, Map));
    }
  }
  
  void spawnWave1(Map Map){
    spacing = 1000;
    spawnEnemy("basic", 15, Map); 
  }
  
  void spawnWave2(Map Map){
    spacing = 1000;
    spawnEnemy("basic", 5, Map); 
    spawnEnemy("quick", 3, Map); 
    spawnEnemy("basic", 5, Map); 
  }
  
  void spawnWave3(Map Map){
    spacing = 500;
    spawnEnemy("basic", 5, Map); 
    spawnEnemy("tank", 1, Map);
    spawnEnemy("basic", 5, Map); 
    spawnEnemy("quick", 5, Map); 
  }
  
  void spawnWave4(Map Map){
    spacing = 800;
    spawnEnemy("tank", 5, Map);
    spawnEnemy("basic", 4, Map);
    spawnEnemy("quick", 10,Map); 
  }
  
  void spawnWave5(Map Map){
    spacing = 500;
    for(int i = 0; i < 3; i++){
      spawnEnemy("basic", 5, Map); 
      spawnEnemy("quick", 5, Map);       
    }
  }
  
  void spawnWave6(Map Map){
    spacing = 200;
    for(int i = 0; i < 5; i++){
      spawnEnemy("basic", 10, Map);
      spawnEnemy("tank", 1, Map);
    }
  }
  
  void spawnWave7(Map Map){
    spacing = 1000;
    spawnEnemy("boss", 1, Map);
    spawnEnemy("basic", 10, Map);
  }
  
  void spawnWave8(Map Map){
    spacing = 300;
    spawnEnemy("boss", 1, Map);
    for(int i = 0; i < 10; i++){
      spawnEnemy("basic", 1, Map);
      spawnEnemy("quick", 1, Map);
      spawnEnemy("tank", 1, Map);
    }
  }
  
  void spawnWave9(Map Map){
    spacing = 500;
    spawnEnemy("tank", 1, Map);
    spawnEnemy("boss", 1, Map);
    spawnEnemy("tank", 1, Map);
    spawnEnemy("quick", 10, Map);
    spawnEnemy("tank", 1, Map);
    spawnEnemy("basic", 10, Map); 
  }
  
  void spawnWave10(Map Map){
    spacing = 900;
    spawnEnemy("tank", 3, Map); 
    spawnEnemy("boss", 1, Map);
    spawnEnemy("basic", 8, Map); 
    spawnEnemy("tank", 3, Map); 
    spawnEnemy("quick", 10, Map); 
    spawnEnemy("boss", 1, Map);
    spawnEnemy("basic", 15, Map); 
    spawnEnemy("boss", 1, Map);
    spawnEnemy("quick", 10, Map); 
  }
}

class WaveTracker {
  
  int wave;
  boolean spawning;
  long timeSinceLastSpawn; 
  int spacing; // Spacing between enemy spawns
  List<Enemy> enemyQueue = new ArrayList<Enemy>();
  int[] waveTimes = {5, 30, 60, 100, 140, 180, 230, 290, 360, 420};
  
  public WaveTracker(){
    wave = 0;
    spawning = false;
  }
  
  void checkWaveSpawn(GameTracker Game, Map Map){
    if(spawning == false){
      for(int i = 0; i < 10; i++){
        if(Game.time == waveTimes[i]){ // Check if a new wave should begin
          beginNewWave(Game, Map); 
        }
      }
      
    }
  }
  
  void beginNewWave(GameTracker Game, Map Map){
     System.out.println("Spawning a new wave");
     wave++;
     Game.money += 200; // give the player a free $200 each wave
     spawning = true;
     timeSinceLastSpawn = System.currentTimeMillis();
     spawnWave(Game, Map);
  }
  
  void spawnWave(GameTracker Game, Map Map){
    if(spawning){
      if(wave == 1){
        spawnWave1(Game, Map);
      }
      if(wave == 2){
        spawnWave2(Game);
      }
      if(wave == 3){
        spawnWave3(Game);
      }
      if(wave == 4){
        spawnWave4(Game);
      }
      if(wave == 5){
        spawnWave5(Game);
      }
      if(wave == 6){
        spawnWave6(Game);
      }
      if(wave == 7){
        spawnWave7(Game);
      }
      if(wave == 8){
        spawnWave8(Game);
      }
      if(wave == 9){
        spawnWave9(Game);
      }
      if(wave == 10){
        spawnWave10(Game);
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
        }
      }
    }
  }
  
  void spawnBasic(Map Map){
    enemyQueue.add(new Enemy("basic", Map));
  }
  
  void spawnQuick(Map Map){
    enemyQueue.add(new Enemy("quick", Map));
  }
  
  void spawnTank(Map Map){
    enemyQueue.add(new Enemy("tank", Map));
  }
  
  void spawnBoss(Map Map){
    enemyQueue.add(new Enemy("boss", Map));
  }
  
  // Enemy(int hp, int spd, int arm, int dmg, int xPosition, int yPosition, int enemyWidth)
  void spawnWave1(GameTracker Game, Map Map){
    spacing = 1000;
    spawnBoss(Map);
    spawnQuick(Map);
    spawnTank(Map);
    spawnBasic(Map);
  }
  
  // Enemy(int hp, int spd, int arm, int dmg, int xPosition, int yPosition, int enemyWidth)
  void spawnWave2(GameTracker Game){
    spacing = 100;
  }
  
  // Enemy(int hp, int spd, int arm, int dmg, int xPosition, int yPosition, int enemyWidth)
  void spawnWave3(GameTracker Game){
    spacing = 1000;
  }
  
  // Enemy(int hp, int spd, int arm, int dmg, int xPosition, int yPosition, int enemyWidth)
  void spawnWave4(GameTracker Game){
    spacing = 1000;
  }
  
  // Enemy(int hp, int spd, int arm, int dmg, int xPosition, int yPosition, int enemyWidth)
  void spawnWave5(GameTracker Game){
    spacing = 1000;
  }
  
  // Enemy(int hp, int spd, int arm, int dmg, int xPosition, int yPosition, int enemyWidth)
  void spawnWave6(GameTracker Game){
    spacing = 1000;
  }
  
  // Enemy(int hp, int spd, int arm, int dmg, int xPosition, int yPosition, int enemyWidth)
  void spawnWave7(GameTracker Game){
    spacing = 1000;
  }
  
  // Enemy(int hp, int spd, int arm, int dmg, int xPosition, int yPosition, int enemyWidth)
  void spawnWave8(GameTracker Game){
    spacing = 1000;
  }
  
  // Enemy(int hp, int spd, int arm, int dmg, int xPosition, int yPosition, int enemyWidth)
  void spawnWave9(GameTracker Game){
    spacing = 1000;
  }
  
  // Enemy(int hp, int spd, int arm, int dmg, int xPosition, int yPosition, int enemyWidth)
  void spawnWave10(GameTracker Game){
    spacing = 1000;
  }
}

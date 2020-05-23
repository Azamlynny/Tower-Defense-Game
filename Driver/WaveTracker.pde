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
  
  void checkWaveSpawn(GameTracker Game, Map Map){
    // TODO: ADD CHECK TO MAKE SURE NO MORE ENEMIES NEED TO SPAWN
    //if(Game.enemyList.size() == 0 && Game.time >= 5){
    //  beginNewWave(Game);
    //}
    
    // Wave 1 
    if(Game.time == 5){
      beginNewWave(Game, Map);
    }
    
    // Wave 2
    if(Game.time == 30){
      beginNewWave(Game, Map);
    }
    
  }
  
  void beginNewWave(GameTracker Game, Map Map){
     System.out.println("Spawning a new wave");
     wave++;
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
      System.out.println(timeElapsed);
      if(timeElapsed >= spacing){
        timeSinceLastSpawn = System.currentTimeMillis();
        
        // Add a new enemy object to the enemies in game  
        Game.enemyList.add(enemyQueue.get(0));
        // Pop the first enemy off the enemy queue
        enemyQueue.remove(0);
      }
    }
  }
  
  // Enemy(int hp, int spd, int arm, int dmg, int xPosition, int yPosition, int enemyWidth)
  void spawnWave1(GameTracker Game, Map Map){
    spacing = 1000;
    for(int i = 0; i < 10; i++){
      enemyQueue.add(new Enemy(1, 10, 0, 1, 50, Map));
    }
  }
  
  // Enemy(int hp, int spd, int arm, int dmg, int xPosition, int yPosition, int enemyWidth)
  void spawnWave2(GameTracker Game){
    spacing = 1000;
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

class WaveTracker {
  
  int wave;
  boolean spawning;
  long timeSinceLastSpawn; 
  int spacing; // Spacing between enemy spawns
  List<Enemy> enemyQueue = new ArrayList<Enemy>();
  int[] waveTimes = {5, 30, 55, 85, 125, 150, 195, 220, 265, 310};
  
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
        spawnWave1(Map);
      }
      if(wave == 2){
        spawnWave2(Map);
      }
      if(wave == 3){
        spawnWave3(Map);
      }
      if(wave == 4){
        spawnWave4(Map);
      }
      if(wave == 5){
        spawnWave5(Map);
      }
      if(wave == 6){
        spawnWave6(Map);
      }
      if(wave == 7){
        spawnWave7(Map);
      }
      if(wave == 8){
        spawnWave8(Map);
      }
      if(wave == 9){
        spawnWave9(Map);
      }
      if(wave == 10){
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
  void spawnWave1(Map Map){
    spacing = 1000;
    for(int i = 0; i < 15; i++){
      spawnBasic(Map); 
    }
  }
  
  // Enemy(int hp, int spd, int arm, int dmg, int xPosition, int yPosition, int enemyWidth)
  void spawnWave2(Map Map){
    spacing = 1000;
    for(int i = 0; i < 5; i++){
      spawnBasic(Map); 
    }
    for(int i = 0; i < 3; i++){
      spawnQuick(Map); 
    }
    for(int i = 0; i < 5; i++){
      spawnBasic(Map); 
    }
  }
  
  // Enemy(int hp, int spd, int arm, int dmg, int xPosition, int yPosition, int enemyWidth)
  void spawnWave3(Map map){
    spacing = 500;
    for(int i = 0; i < 5; i++){
      spawnBasic(Map); 
    }
    spawnTank(Map);
    for(int i = 0; i < 5; i++){
      spawnBasic(Map); 
    }
    for(int i = 0; i < 5; i++){
      spawnQuick(Map); 
    }
  }
  
  // Enemy(int hp, int spd, int arm, int dmg, int xPosition, int yPosition, int enemyWidth)
  void spawnWave4(Map map){
    spacing = 2000;
    for(int i = 0; i < 5; i++){
      spawnTank(Map);
    }
    for(int i = 0; i < 3; i++){
      spawnBasic(Map);
    }
    for(int i = 0; i < 10; i++){
      spawnQuick(Map); 
    }
  }
  
  // Enemy(int hp, int spd, int arm, int dmg, int xPosition, int yPosition, int enemyWidth)
  void spawnWave5(Map map){
    spacing = 500;
    for(int i = 0; i < 5; i++){
      spawnBasic(Map); 
    }
    for(int i = 0; i < 5; i++){
      spawnQuick(Map); 
    }
    for(int i = 0; i < 5; i++){
      spawnBasic(Map); 
    }
    for(int i = 0; i < 5; i++){
      spawnQuick(Map); 
    }
    for(int i = 0; i < 5; i++){
      spawnBasic(Map); 
    }
    for(int i = 0; i < 5; i++){
      spawnQuick(Map); 
    }
  }
  
  // Enemy(int hp, int spd, int arm, int dmg, int xPosition, int yPosition, int enemyWidth)
  void spawnWave6(Map map){
    spacing = 200;
    for(int i = 0; i < 5; i++){
      for(int o = 0; o < 10; o++){
        spawnBasic(Map); 
      }
      spawnTank(Map);
    }
  }
  
  // Enemy(int hp, int spd, int arm, int dmg, int xPosition, int yPosition, int enemyWidth)
  void spawnWave7(Map map){
    spacing = 1000;
    spawnBoss(Map);
    for(int i = 0; i < 10; i ++){
      spawnBasic(Map); 
    }
  }
  
  // Enemy(int hp, int spd, int arm, int dmg, int xPosition, int yPosition, int enemyWidth)
  void spawnWave8(Map map){
    spacing = 1000;
    for(int i = 0; i < 10; i++){
      for(int o = 0; o < 3; i++){
         spawnBasic(Map);
         spawnQuick(Map);
      }
      spawnTank(Map);
    }
  }
  
  // Enemy(int hp, int spd, int arm, int dmg, int xPosition, int yPosition, int enemyWidth)
  void spawnWave9(Map map){
    spacing = 500;
    spawnTank(Map);
    spawnBoss(Map);
    spawnTank(Map);
    for(int i = 0; i < 10; i++){
      spawnQuick(Map); 
    }
    spawnTank(Map);
    for(int i = 0; i < 10; i++){
      spawnBasic(Map); 
    }
  }
  
  // Enemy(int hp, int spd, int arm, int dmg, int xPosition, int yPosition, int enemyWidth)
  void spawnWave10(Map map){
    spacing = 1000;
    for(int i = 0; i < 3; i++){
      spawnTank(Map); 
    }
    spawnBoss(Map);
    for(int i = 0; i < 8; i++){
      spawnBasic(Map); 
    }
    for(int i = 0; i < 3; i++){
      spawnTank(Map); 
    }
    for(int i = 0; i < 10; i++){
      spawnQuick(Map); 
    }
    spawnBoss(Map);
    for(int i = 0; i < 15; i++){
      spawnBasic(Map); 
    }
    spawnBoss(Map);
    for(int i = 0; i < 10; i++){
      spawnQuick(Map); 
    }
  }
}

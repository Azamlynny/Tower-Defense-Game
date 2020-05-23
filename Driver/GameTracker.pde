class GameTracker {

  int money;
  int hearts;
  List<Enemy> enemyList = new ArrayList<Enemy>();
  
  public GameTracker() {
    money = 500;
    hearts = 50;
  }
  
  void gameTick(Map Map){ // Iterates the game and all of its elements every frame
    for(int i = 0; i < enemyList.size(); i++){
      enemyList.get(i).move(Map); 
    }
    
  }
  
  void drawEntities(){
    for(int i = 0; i < enemyList.size(); i++){
      enemyList.get(i).drawEnemy(); 
    }
  }
  
}

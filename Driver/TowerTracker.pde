// TowerTracker

class TowerTracker {
 
  List<Tower> towerList = new ArrayList<Tower>();

  public TowerTracker(){
    
  }
  
  void runTowerActions(GameTracker Game){
    fireTowers(Game);
    drawTowers();
  }
  
  void fireTowers(GameTracker Game){
    for(int i = 0; i < towerList.size(); i++){
       towerList.get(i).checkCooldown(Game);
     }
  }
  
  void drawTowers(){
     for(int i = 0; i < towerList.size(); i++){
       towerList.get(i).drawTower();
     }
  }
  
}

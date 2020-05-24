class MouseManager {
  
  boolean draggingTower;
  String towerSelected;
  
  public MouseManager() {
    draggingTower = true;
    towerSelected = "sniper";
  }
  
  void leftClick(Map Map, GameTracker Game){
    if(draggingTower == false){
      
    }
    else if(mouseY < 880 && draggingTower == true){
      int mouseXCoord = ((int) (mouseX/Map.tileWidth));  
      int mouseYCoord = ((int) (mouseY/Map.tileWidth));

      if(Map.tiles[mouseXCoord][mouseYCoord].type.equals("empty")){
        Game.TTracker.towerList.add(new Tower(mouseXCoord, mouseYCoord, towerSelected, Map));
        Map.tiles[mouseXCoord][mouseYCoord].type = "tower";
      }
    }
  }
       
}

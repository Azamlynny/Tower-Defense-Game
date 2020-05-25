class MouseManager {
  
  boolean draggingTower;
  String towerSelected;
  
  public MouseManager() {
    draggingTower = false;
  }
  
    //rect(900, 960, 100, 100);
    //rect(1150, 960, 100, 100);
    //rect(1400, 960, 100, 100);
    //rect(1650, 960, 100, 100);
  
  void leftClick(Map Map, GameTracker Game){
    if(draggingTower == false){
      if(mouseX >= 850 && mouseX <= 950 && mouseY >= 910 && mouseY <= 1010 && Game.money >= 250){ // basic
        towerSelected = "basic";
        draggingTower = true;
        Game.money -= 250; // basic costs $250
      }
      else if(mouseX >= 1100 && mouseX <= 1200 && mouseY >= 910 && mouseY <= 1010 && Game.money >= 300){ // burst
        towerSelected = "burst";
        draggingTower = true;
        Game.money -= 300; // burst costs $300
      }
      else if(mouseX >= 1350 && mouseX <= 1450 && mouseY >= 910 && mouseY <= 1010 && Game.money >= 400){ // sniper
        towerSelected = "sniper";
        draggingTower = true;
        Game.money -= 400; // sniper costs $400
      }
      else if(mouseX >= 1600 && mouseX <= 1700 && mouseY >= 910 && mouseY <= 1010 && Game.money >= 800){ // slow
        towerSelected = "slow";
        draggingTower = true;
        Game.money -= 800; // slow costs $800
      }
    }
    else if(mouseY < 880 && draggingTower == true){
      int mouseXCoord = ((int) (mouseX/Map.tileWidth));  
      int mouseYCoord = ((int) (mouseY/Map.tileWidth));

      if(Map.tiles[mouseXCoord][mouseYCoord].type.equals("empty")){
        Game.TTracker.towerList.add(new Tower(mouseXCoord, mouseYCoord, towerSelected, Map));
        Map.tiles[mouseXCoord][mouseYCoord].type = "tower";
        draggingTower = false;
      }
    }
  }
       
}

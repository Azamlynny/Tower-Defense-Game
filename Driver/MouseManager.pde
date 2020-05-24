class MouseManager {
  
  boolean draggingTower;
  String towerSelected;
  
  public MouseManager() {
    draggingTower = true;
    towerSelected = "basic";
  }
  
  void leftClick(Map Map, GameTracker Game){
    if(draggingTower == false){
      
    }
    else if(mouseY < 880 && draggingTower == true){
      int mouseXCoord = ((int) (mouseX/Map.tileWidth));  
      int mouseYCoord = ((int) (mouseY/Map.tileWidth));
      //System.out.println(mouseXCoord + " " + mouseYCoord); // debugging
      if(Map.tiles[mouseXCoord][mouseYCoord].type.equals("empty")){
        if(towerSelected.equals("basic")){
          Game.TTracker.towerList.add(new Tower(mouseXCoord, mouseYCoord, 500, 3000, 3, 250, 60, 25, 20, Map));
        }
        
        
        Map.tiles[mouseXCoord][mouseYCoord].type = "tower";
      }
    }
  }
       
}

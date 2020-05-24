class GUI {
  int screenWidth = 1960;
  int screenHeight = 1080;
  
  public GUI() {

  }
  
  void drawGUI(GameTracker Game){
    textSize(32);
    
    // Draw GUI Box background
    fill(42, 79, 135); // dark blue
    rect(screenWidth/2, 980, screenWidth, 200);
    
    // Draw money
    fill(255, 223, 61);
    text("Money: $" + Game.money, 100, 1000);
    
    // Draw hearts
    fill(255, 50, 50);
    text("Hearts: " + Game.hearts, 100, 1050);
    
    // Draw Tower backplates
    fill(212);
    rect(900, 960, 100, 100);
    rect(1150, 960, 100, 100);
    rect(1400, 960, 100, 100);
    rect(1650, 960, 100, 100);
  }
 
}

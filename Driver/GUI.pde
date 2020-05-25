class GUI {
  int screenWidth = 1960;
  int screenHeight = 1080;

  public GUI() {
  }

  void drawGUI(GameTracker Game, MouseManager MManager) {
    textSize(32);

    // Draw GUI Box background
    fill(42, 79, 135); // dark blue
    stroke(0);
    strokeWeight(1);
    rect(screenWidth/2, 980, screenWidth, 200);

    textAlign(LEFT);
    textSize(48);

    // Draw money
    fill(255, 209, 0);
    text("Money: $" + Game.money, 70, 950);

    // Draw hearts
    fill(255, 50, 50);
    text("Hearts: " + Game.hearts, 70, 1030);

    // Draw time until next wave
    fill(255);
    textSize(38);
    textAlign(CENTER);
    text("Next Wave", 610, 930);

    // Draw progress bar to next wave
    fill(212);
    rect(610, 1000, 300, 100);
    if (Game.WTracker.wave > 0) {
      int waveDuration = Game.WTracker.waveTimes[Game.WTracker.wave] - Game.WTracker.waveTimes[Game.WTracker.wave - 1]; // Time between the two waves
      int timeUntilNextWave = Game.WTracker.waveTimes[Game.WTracker.wave] - (int) Game.time; // Difference between next wave and current time
      fill(255, 56, 56);
      rectMode(CORNER);
      noStroke();
      rect(460, 950, (int) (300 * ((float)timeUntilNextWave / (float) waveDuration)), 100);
    }

    strokeWeight(1);
    rectMode(CENTER);

    // Draw Tower backplates
    fill(212);
    rect(900, 960, 100, 100);
    rect(1150, 960, 100, 100);
    rect(1400, 960, 100, 100);
    rect(1650, 960, 100, 100);

    // Basic
    fill(16, 70, 196);
    rect(900, 960, 75, 75);
    noFill();
    strokeWeight(3);
    stroke(145, 176, 250);
    rect(900, 960, 60, 60);

    textAlign(CENTER);
    textSize(20);
    fill(255);
    text("Basic", 900, 905);

    textSize(30);
    fill(255, 209, 0);
    text("$250", 900, 1050);

    textAlign(LEFT);
    textSize(20);
    fill(230);
    text("DAMAGE:  3", 960, 935);
    text("RANGE: 500", 960, 960);
    text("SPEED:    3s", 960, 985);

    // Burst    
    fill(167, 36, 179);
    noStroke();
    rect(1150, 960, 65, 65);

    textAlign(CENTER);
    textSize(20);
    fill(255);
    text("Burst", 1150, 905);

    textSize(30);
    fill(255, 209, 0);
    text("$300", 1150, 1050);

    textAlign(LEFT);
    textSize(20);
    fill(230);
    text("DAMAGE:  1", 1210, 935);
    text("RANGE: 300", 1210, 960);
    text("SPEED:  0.5s", 1210, 985);

    // Sniper
    fill(2, 110, 22);
    strokeWeight(3);
    stroke(24, 61, 26);
    triangle(1400, 932.5, 1367.6, 988.75, 1432.4, 988.75);

    textAlign(CENTER);
    textSize(20);
    fill(255);
    text("Sniper", 1400, 905);

    textSize(30);
    fill(255, 209, 0);
    text("$400", 1400, 1050);

    textAlign(LEFT);
    textSize(20);
    fill(230);
    text("DAMAGE:   10", 1460, 935);
    text("RANGE:  1000", 1460, 960);
    text("SPEED:       5s", 1460, 985);

    // Slow
    fill(104, 228, 237);
    stroke(109, 188, 194);
    strokeWeight(3);
    ellipse(1650, 960, 70, 70);

    textAlign(CENTER);
    textSize(20);
    fill(255);
    text("Slow", 1650, 905);

    textSize(30);
    fill(255, 209, 0);
    text("$800", 1650, 1050);

    textAlign(LEFT);
    textSize(20);
    fill(230);
    text("DAMAGE:     15", 1710, 935);
    text("RANGE:      600", 1710, 960);
    text("SPEED:          8s", 1710, 985);

    // draw tower selection
    if (MManager.draggingTower) {
      int radius = 0;
      int towerWidth;
      if (MManager.towerSelected == "basic") {
        towerWidth = 60;
        radius = 500;  
        fill(16, 70, 196);
        stroke(0);
        strokeWeight(1);
        rect(mouseX, mouseY, towerWidth, towerWidth);
        noFill();
        strokeWeight(3);
        stroke(145, 176, 250);
        rect(mouseX, mouseY, towerWidth - 10, towerWidth - 10);
      } 
      else if (MManager.towerSelected == "burst") {
        towerWidth = 40;
        radius = 300;
        fill(167, 36, 179);
        noStroke();
        rect(mouseX, mouseY, towerWidth, towerWidth);
      } 
      else if (MManager.towerSelected == "sniper") {
        towerWidth = 30;
        radius = 1000;
        fill(2, 110, 22);
        strokeWeight(3);
        stroke(24, 61, 26);
        triangle(mouseX, mouseY - towerWidth + 10, mouseX - 0.866 * towerWidth, mouseY + towerWidth / 2 + 10, mouseX + 0.866 * towerWidth, mouseY + towerWidth / 2 + 10);
      } 
      else if (MManager.towerSelected == "slow") {
        towerWidth = 50;
        radius = 600;
        fill(104, 228, 237);
        stroke(109, 188, 194);
        strokeWeight(3);
        ellipse(mouseX, mouseY, towerWidth, towerWidth);
      }
      strokeWeight(1);
      stroke(100);
      noFill();
      ellipse(mouseX, mouseY, radius, radius);
    }
  }
}

      // EnemyTracker
      
      class EnemyTracker {
       
        List<Enemy> enemyList = new ArrayList<Enemy>();
      
        public EnemyTracker(){
          
        }
        
        void runEnemyActions(GameTracker Game, Map Map){
          moveEnemies(Map, Game);
          discardEnemies(Game);
          drawEnemies();
        }
        
        void moveEnemies(Map Map, GameTracker Game){
          for(int i = 0; i < enemyList.size(); i++){
            enemyList.get(i).move(Map, Game); 
          }
        }
        
        void drawEnemies(){
           for(int i = 0; i < enemyList.size(); i++){
            enemyList.get(i).drawEnemy();
           }
        }
        
        void discardEnemies(GameTracker Game){ // Deletes any enemies with less than 0 health
          for(int i = 0; i < enemyList.size(); i++){
            if(enemyList.get(i).health <= 0){ // discard dead enemies
              Game.money += enemyList.get(i).moneyDropped;
              enemyList.remove(i); 
            }
          }
        }
        
        
      }

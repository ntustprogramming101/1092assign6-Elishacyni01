class Robot extends Enemy{
	// Requirement #5: Complete Dinosaur Class

	final int PLAYER_DETECT_RANGE_ROW = 2;
	final int LASER_COOLDOWN = 180;
	final int HAND_OFFSET_Y = 37;
	final int HAND_OFFSET_X_FORWARD = 64;
	final int HAND_OFFSET_X_BACKWARD = 16;
  float speed = 2f;
  boolean imageRight = true;
  boolean isReady = true;
  int laserTimer;
  Laser laser;
  
  void display(){
    if(imageRight == true){
      image(robot, x, y);
    }else{
      image(robot1, x, y);
    }
    laser.display();
  }
  
  void update(){
    
    
    
    
    
    // isReady
    if(!isReady){
      laserTimer -= 1;
      if(laserTimer == 0) isReady = true;
    }
    
    // checkX & checkY
    if(checkX() && checkY()){
      
      x += 0;
      // Is laser's cooldown ready?
      if(isReady){
        
        if(speed > 0){
          laser.fire(x + HAND_OFFSET_X_FORWARD, y + HAND_OFFSET_Y, player.x + w / 2, player.y + h / 2);
        }else{
          laser.fire(x + HAND_OFFSET_X_BACKWARD, y + HAND_OFFSET_Y, player.x + w / 2, player.y + h / 2);
        }
        laserTimer = LASER_COOLDOWN;
        isReady = false;
      }
      
    }else{
      
      // Keep moving!
      x += speed;
      
      if(x >= width - SOIL_SIZE || x <= 0){
        
        speed *= -1;
        
        if(imageRight == true){
          
          imageRight = false;
          
        }else if(imageRight == false){
          
          imageRight = true;
        }
      }
    }
    laser.update();
  }
  
  void checkCollision(Player player) {

    super.checkCollision(player);
    laser.checkCollision(player);
  }
  
  boolean checkX(){
    return (speed > 0 &&  player.x + w / 2 > x + HAND_OFFSET_X_FORWARD) || 
    (speed < 0 &&  player.x + w / 2 < x + HAND_OFFSET_X_BACKWARD);
  }
  
  boolean checkY(){
    return player.y <= y + PLAYER_DETECT_RANGE_ROW * w  && player.y >= y - PLAYER_DETECT_RANGE_ROW * w;
    
  }
  
  Robot(float x, float y){
    super(x, y);
    laser = new Laser();
    imageRight = true;
    isReady = true;
    laserTimer = 0;
  }
  
	// HINT: Player Detection in update()
	/*

	boolean checkX = ( Is facing forward AND player's center point is in front of my hand point )
					OR ( Is facing backward AND player's center point (x + w/2) is in front of my hand point )

	boolean checkY = player is less than (or equal to) 2 rows higher or lower than me

	if(checkX AND checkY){
		Is laser's cooldown ready?
			True  > Fire laser from my hand!
			False > Don't do anything
	}else{
		Keep moving!
	}

	*/
}

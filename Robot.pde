class Robot extends Enemy{
	// Requirement #5: Complete Dinosaur Class

	final int PLAYER_DETECT_RANGE_ROW = 2;
	final int LASER_COOLDOWN = 180;
	final int HAND_OFFSET_Y = 37;
	final int HAND_OFFSET_X_FORWARD = 64;
	final int HAND_OFFSET_X_BACKWARD = 16;
  float speed = 2f;
  boolean imageRight = true;
  boolean checkX, checkY;
  
  void display(){
    if(imageRight == true){
      image(robot, x, y);
    }else{
      image(robot1, x, y);
    }
  }
  
  void update(){
    
    // checkX
    if(speed > 0 && player.x > x || speed < 0 && player.x < x){
      checkX = true;
    }else{
      checkX = false;
    }
    
    // checkY
    if( (player.row - y / SOIL_SIZE) <= PLAYER_DETECT_RANGE_ROW || (player.row - y / SOIL_SIZE) >= PLAYER_DETECT_RANGE_ROW){
      checkY = true;
    }else{
      checkY = false;
    }
    
    // checkX & checkY
    
    if(checkX && checkY){
      
      // Is laser's cooldown ready?
      
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
  }
  
  
  
  Robot(float x, float y){
    super(x, y);
    imageRight = true;
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

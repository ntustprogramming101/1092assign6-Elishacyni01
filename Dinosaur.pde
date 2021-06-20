class Dinosaur extends Enemy{
	// Requirement #4: Complete Dinosaur Class

	final float TRIGGERED_SPEED_MULTIPLIER = 5;
  float speed = 1f;
  float currentSpeed = speed;
  
  void display(){
    if(currentSpeed > 0){
      image(dinosaur, x, y);
    }else if(currentSpeed < 0){
      image(dinosaur2, x, y);
    }
  }

  void update(){
    x += currentSpeed;
    
    // boundary detection
    if(x + w >= width || x <= 0){
      currentSpeed *= -1;
    }
 
    
    if(y == player.y){
      
      // player leftside
      if(player.x <= x && currentSpeed < 0){
       currentSpeed = TRIGGERED_SPEED_MULTIPLIER * speed *(-1);
      }else if(player.x >= x && currentSpeed > 0){
        currentSpeed = TRIGGERED_SPEED_MULTIPLIER * speed;
      }
      
    }
  }
  
  void checkCollision(Player player){

    if(isHit(x, y, w, h, player.x, player.y, player.w, player.h)){

      player.hurt();
      currentSpeed = speed;
      
    }
  }

  Dinosaur(float x, float y){
    super(x, y);
  }
  
	// HINT: Player Detection in update()
	/*
	float currentSpeed = speed
	If player is on the same row with me AND (it's on my right side when I'm going right OR on my left side when I'm going left){
		currentSpeed *= TRIGGERED_SPEED_MULTIPLIER
	}
	*/
}

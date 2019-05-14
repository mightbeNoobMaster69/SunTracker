JSONObject data;
float diffAngle; //difference passed beetween the old angle and the new one
float prevAngle; //holds the last angle used
float wayToGo; //rotation beetwen the old angle and the new one
float rotAngle = 0; //the actual rotation applied

void setup() {
  size(600, 400);
  data = loadJSONObject("data/data.json"); //load the json file
  prevAngle = data.getFloat("angle");
  wayToGo = prevAngle;
  diffAngle = 0;
}

void draw(){
  background(0);
  
  data = loadJSONObject("data/data.json"); //load the json file
  float angle = data.getFloat("angle"); //angle in degrees
  float sunx = data.getFloat("sunx"); //pos x of the sun(in the normal cartesian way - x going from 0-100, and y going up from 0-100)
  float suny = data.getFloat("suny"); // pos y of the sun(in the normal cartesian way - x going from 0-100, and y going up from 0-100)
  
  sunx = map(sunx, 0, 100, 0, width); //convert the range of x proportionally to the size of screen
  suny = map(suny, 0, 100, 0, height);//convert the range of y proportionally to the size of screen
  
  suny = height - suny;//the value of suny converted in map() is in a way that y goes in the direction top-bottom,
                       //but on the file it was given in the normal cartesian way, bottom-top  
  
  //drawing the SUN
  stroke(#F6FF00);
  strokeWeight(10);
  point(sunx, suny);
  
  if(angle != prevAngle){
    //new angle provided
    diffAngle = 0; //difference passed set to 0
    wayToGo = angle - (prevAngle); //calculate the total difference beetween the angles
    
    prevAngle = angle; //update the last angle
  }
  
  if(wayToGo > 0){ //positive distance(rotation is getting higher)
    if(diffAngle <= wayToGo){ //while the difference passed isnt equal to the total distance
      diffAngle += 0.1; //update the diff passed
      rotAngle = rotAngle + 0.1; //apply tiny rotation in the rot variable
    }
    else{      
    }
  }
  else{ //negative distance(rotation is getting lower)
    if(diffAngle >= wayToGo){ //while the difference passed isnt equal to the total distance
      diffAngle -= 0.1; //update diff passed
      rotAngle = rotAngle - 0.1; //apply tiny rotation in the rot variable
    }
    else{
    }
  }
  
  //debugging stuff
  println("waytogo:" + wayToGo);
  println("diff angle:" + diffAngle);
  println("rot angle:"+ rotAngle);
  println("--------------");
  
  //rotating the tracker according to the angle
  translate(300,300);
  rotate(radians(rotAngle));  
  //drawing the tracker
  stroke(255);
  strokeWeight(1);
  rect(-100, 0, 200, 5);
}

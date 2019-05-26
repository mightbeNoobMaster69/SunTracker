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
  
  //---------------------------------------------GETTING JSON DATA-------------------------------------------------
  data = loadJSONObject("data/data.json"); //load the json file
  
  float angle = data.getFloat("angle"); //angle in degrees
  
  float sunx = data.getFloat("sunx"); //pos x of the sun(in the normal cartesian way - x going from 0-100, and y going up from 0-100)
  float suny = data.getFloat("suny"); // pos y of the sun(in the normal cartesian way - x going from 0-100, and y going up from 0-100)
  
  float leftSensorx = data.getFloat("leftx");
  float middleSensorx = data.getFloat("middlex");
  float rightSensorx = data.getFloat("rightx");
  
  float leftSensory = data.getFloat("lefty");
  float middleSensory = data.getFloat("middley");
  float rightSensory = data.getFloat("righty");
  //--------------------------------------------------------------------------------------------------------------------
  
  //-------------------------MAPPING VALUES - FROM CARTESIAN WAY(100,100) TO SCREEN(600,400)---------------------------
  leftSensorx = map(leftSensorx, 0, 100, 0, width);
  leftSensory = map(leftSensory, 0, 100, 0, height);
  leftSensory = height - leftSensory;

  middleSensorx = map(middleSensorx, 0, 100, 0, width);
  middleSensory = map(middleSensory, 0, 100, 0, height);
  middleSensory = height - middleSensory;
  
  rightSensorx = map(rightSensorx, 0, 100, 0, width);
  rightSensory = map(rightSensory, 0, 100, 0, height);
  rightSensory = height - rightSensory;
  
  sunx = map(sunx, 0, 100, 0, width); //convert the range of x proportionally to the size of screen
  suny = map(suny, 0, 100, 0, height);//convert the range of y proportionally to the size of screen
  suny = height - suny;//the value of suny converted in map() is in a way that y goes in the direction top-bottom,
                       //but on the file it was given in the normal cartesian way, bottom-top  
                       
  //----------------------------------------------------------------------------------------------------------
  
  //------------------------------------------ANGLE ROTATION SYSTEM------------------------------------------------------
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
  
  ////debugging stuff
  //println("waytogo:" + wayToGo);
  //println("diff angle:" + diffAngle);
  //println("rot angle:"+ rotAngle);
  //println("--------------");  
  
  //-----------------------------------------------------------------------------------------------
       
  //----------------------------------------------------DRAWING--------------------------------------
  
  //drawing the SUN
  stroke(#F6FF00);
  strokeWeight(10);
  point(sunx, suny);
  
  //rotating the tracker according to the angle
  translate(300,middleSensory);
  rotate(radians(rotAngle));  
  
  //drawing the tracker
  stroke(255);
  strokeWeight(1);
  rect(-100, 0, 200, 5);
  
  //drawing the sensors
  strokeWeight(15);
  point(leftSensorx, leftSensory);
  
  //---------------------------------------------------------------------------------------------
}

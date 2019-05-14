JSONObject data;

void setup() {
  size(600, 400);
}

void draw(){
  background(0);
  
  data = loadJSONObject("data/data.json");
  float angle = data.getFloat("angle");
  
  translate(300,300);
  rotate(radians(angle));  
  
  rect(-100, 0, 200, 5);
}

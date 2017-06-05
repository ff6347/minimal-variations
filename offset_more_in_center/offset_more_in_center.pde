void setup() {
  size(500, 500);
  background(250);
  float x = 0;
  float y = height/2;
  float alpha = 50;
  //fill(200, alpha);
  //stroke(20, alpha);
  //strokeWeight(1);

  float prevx = x;
  float prevy = y;
  while (x < width) {
    x+=2;
    //y = x;
    float factor = 0;
    if (x < width/2) {
      factor = dist(x, y, 0, height/2) ;
    } else {
      factor = dist(x, y, width, height/2) ;
    }
    factor /=5;
    float xoff = random(-factor, factor);
    float yoff = random(-factor, factor);
    line(x + xoff, y +yoff, prevx, prevy);
    line(x, y, prevx, prevy);
    for (int i = 10; i >= 0; i-=2) {
      ellipse(x + xoff, y +yoff, i, i);
    }
    prevx = x +xoff;
    prevy = y + yoff;
  }
}

void draw() {
}

void keyPressed() {
  if (key == 's' || key == 's') {
    String filename = "out-"+ timestamp() +".png";
    saveFrame(filename);
    println("Saved \"" + filename+ "\" to disk");
  }
}

String timestamp() {
  return year() +"-" + month() +"-" + day() +"-" + hour() +"-" + minute() +"-"+ second();
}
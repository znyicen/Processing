class Blob {
  PVector pos;
  float r;
  PVector vel; // 速度
  
  Blob(float x, float y) {
    pos = new PVector(x,y);
    vel = PVector.random2D(); // 产生的是标准化向量
    vel.mult(random(2, 5));   // 进行缩放
    r = random(10, 150);
  }
  
  void update() {
    pos.add(vel);
    
    if (pos.x > width || pos.x < 0) {
      vel.x *= -1; 
    }
    
    if (pos.y > height || pos.y < 0) {
      vel.y *= -1; 
    }
  }
  
  void show() {
    noFill();
    stroke(0);
    strokeWeight(4);
    ellipse(pos.x, pos.y, r*2, r*2);
  }
}

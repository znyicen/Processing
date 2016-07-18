Blob[] blobs;

void setup() {
  size(600, 300);
  blobs = new Blob[10];
  for (int i = 0; i < blobs.length; i++) {
    blobs[i] = new Blob(random(width), random(height));
  }
  
  colorMode(HSB);
}

void draw() {
  
  background(51);

  loadPixels();
  for (int x = 0; x < width; x++) {
    for (int y = 0; y <height; y++) {
      // int row = x;            // 一行
      // int col = y * width;    // 一列
      int index = x + y * width; // 一面
      
      float sum = 0;
      for (Blob b : blobs) {
        // 画圆方法一：
        // x,y               = st
        // width/2, height/2 = toCenter
        float d = dist(x, y, b.pos.x, b.pos.y);
        
        // 画圆方法二：
        // PVector st = new PVector(x, y);
        // PVector toCenter = new PVector(width/2, height/2);
        // toCenter = toCenter.sub(st);
        // float pct = toCenter.mag();
        
        // 画圆方法三：
        //PVector st = new PVector(x, y);
        //PVector tc = b.pos.get();
        //tc = tc.sub(st);
        //float pct = sqrt(tc.x*tc.x + tc.y*tc.y);
        
        // 对像素做加法运算
        sum += 80 * b.r / d;
      }
      
      // pixels为1维数组
      // 索引顺序为从左至右，从上至下。
      // 修改色轮，使其产生彩虹
      pixels[index] = color(sum % 255, 255, 255);
    }
  }
  
  updatePixels();
  
  for (Blob b : blobs) {
    b.update();
    //b.show();
  }
}

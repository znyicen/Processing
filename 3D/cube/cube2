// 定义顶点
PVector[] ver;
PVector[] face;
PVector[][] uv;
PImage tex;

void setup() {
  size(400, 400, P3D);
  // 设置顶点
  ver = new PVector[8];
  ver[0] = new PVector(-0.5, -0.5,  0.5); // 顶点1
  ver[1] = new PVector(-0.5, -0.5, -0.5); // 顶点2
  ver[2] = new PVector( 0.5, -0.5, -0.5); // ...
  ver[3] = new PVector( 0.5, -0.5,  0.5);


  ver[4] = new PVector(-0.5,  0.5,  0.5);
  ver[5] = new PVector(-0.5,  0.5, -0.5);
  ver[6] = new PVector( 0.5,  0.5, -0.5);
  ver[7] = new PVector( 0.5,  0.5,  0.5);


  // 设置顶点索引
  face = new PVector[12];
  // top
  face[0]  = new PVector(0, 1, 2);
  face[1]  = new PVector(0, 2, 3);
  // front
  face[2]  = new PVector(0, 3, 7);
  face[3]  = new PVector(0, 7, 4);
  // back
  face[4]  = new PVector(1, 2, 6);
  face[5]  = new PVector(1, 6, 5);
  // right
  face[6]  = new PVector(3, 2, 7);
  face[7]  = new PVector(2, 6, 7);
  // left
  face[8]  = new PVector(0, 4, 5);
  face[9]  = new PVector(1, 5, 0);
  // bottom
  face[10] = new PVector(4, 5, 7);
  face[11] = new PVector(5, 6, 7);
  
  // 设置UV
  // 目前有一点苦力活需要干，但很快，将会有东西拯救我们。
  uv = new PVector[12][3]; // 12个面，每个面3个顶点,为每个顶点描述UV
  float max = 2.0;
  // top
  uv[0][0]  = new PVector(0,   max); // face0
  uv[0][1]  = new PVector(0,   0);
  uv[0][2]  = new PVector(max, 0);
  uv[1][0]  = new PVector(0,   max); // face1
  uv[1][1]  = new PVector(max, 0);
  uv[1][2]  = new PVector(max, max);
  // front
  uv[2][0]  = new PVector(0,   0); // face2
  uv[2][1]  = new PVector(max, 0);
  uv[2][2]  = new PVector(max, max);
  uv[3][0]  = new PVector(0,   0); // face3
  uv[3][1]  = new PVector(max, max);
  uv[3][2]  = new PVector(0,   max);
  // back
  uv[4][0]  = new PVector(0,   0); // face4
  uv[4][1]  = new PVector(max, 0);
  uv[4][2]  = new PVector(max, max);
  uv[5][0]  = new PVector(0,   0); // face5
  uv[5][1]  = new PVector(max, max);
  uv[5][2]  = new PVector(0,   max);
  // right
  uv[6][0]  = new PVector(0,   0); // face6
  uv[6][1]  = new PVector(max, 0);
  uv[6][2]  = new PVector(0,   max);
  uv[7][0]  = new PVector(max, 0); // face7
  uv[7][1]  = new PVector(max, max);
  uv[7][2]  = new PVector(0,   max);
  // left
  uv[8][0]  = new PVector(0,   0); // face8
  uv[8][1]  = new PVector(0,   max);
  uv[8][2]  = new PVector(max, max);
  uv[9][0]  = new PVector(max, 0); // face9
  uv[9][1]  = new PVector(max, max);
  uv[9][2]  = new PVector(0,   0);
  // bottom
  uv[10][0] = new PVector(0,   max); // face10
  uv[10][1] = new PVector(0,   0);
  uv[10][2] = new PVector(max, max);
  uv[11][0] = new PVector(0,   0); // face11
  uv[11][1] = new PVector(max, 0);
  uv[11][2] = new PVector(max, max);

  // 设置图形模式
  noStroke();
  
  // 载入贴图
  tex = loadImage("t3.jpg");
  tex.resize(int(256/max), 0);
  
  // 设置纹理属性
  textureMode(NORMAL);
  textureWrap(REPEAT);
}

float angle1 = 0;
float angle2 = 0;
void draw() {
  // 清楚缓冲区
  background(0);


  // 模型矩阵变换
  // 在opengl中，我们建议您在组合矩阵时，先进行缩放操作，
  // 然后是旋转，最后才是平移，否则它们会(消极地)互相影响。
  // 在Processing中，恰恰相反。
  translate(width/2, height/2, -100.0);
  rotateX(radians(angle1));
  rotateY(radians(angle2));
  angle1 += 0.5;
  angle2 += 0.05;
  if (angle1 > 360.0) angle1 = 0;
  if (angle2 > 360.0) angle2 = 0;
  scale(200);
  
  // 绘制图形
  //fill(255, 127, 39);
  for (int i = 0; i < face.length; i++) {
    beginShape();
    texture(tex);
    //     x                    , y                    , z                    , u         , v
    vertex(ver[int(face[i].x)].x, ver[int(face[i].x)].y, ver[int(face[i].x)].z, uv[i][0].x, uv[i][0].y);
    vertex(ver[int(face[i].y)].x, ver[int(face[i].y)].y, ver[int(face[i].y)].z, uv[i][1].x, uv[i][1].y);
    vertex(ver[int(face[i].z)].x, ver[int(face[i].z)].y, ver[int(face[i].z)].z, uv[i][2].x, uv[i][2].y);
    endShape(TRIANGLES);
  }

}

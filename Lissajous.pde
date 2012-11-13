/* Simulation of Lissajous figure */

/****** ↓シミュレーション定数↓ *****/
// 周波数比
final float RATIO_A = 2.0; // Aの周波数比
final float RATIO_B = 1.0; // Bの周波数比
// 振幅
final float AMP_A = 100; // Aの振幅
final float AMP_B = 100; // Bの振幅

final float DELAY = 0.01; // 位相ずれの増分
/****** ↑シミュレーション定数↑ *****/


float d = 0.0;

void setup() {
  size(500, 400);
  smooth();
}

void draw() {
  translate(250, 200);
  background(54, 120, 198);

  strokeWeight(1);
  for(int i = -25; i <= 25; i++) {
    // 補助線
    stroke(50);
    line(i * 50, -200, i * 50, 200); // 縦
    line(-250, i * 50, 250, i * 50); // 横

    // 主軸目盛り    
    stroke(0);
    line(-3, i * 10, 3, i * 10);
    line(i * 10, -3, i * 10, 3);
  }
 
  // 主軸 
  stroke(0);
  strokeWeight(2);
  line(0, -200, 0, 200); // 縦
  line(-250, 0, 250, 0); // 横  
  
  // 信号
  for(float t = -PI; t < PI; t += 0.01) {
    float x = AMP_A * cos(RATIO_A * t);
    float y = -AMP_B * sin(RATIO_B * t + d);
    
    fill(107, 245, 67);
    noStroke();
    ellipse((int)x, (int)y, 5, 5);
  }
  
  d += DELAY;
}

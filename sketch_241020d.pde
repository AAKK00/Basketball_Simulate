int n = 100;
float[] vx = new float[n];
float[] vy = new float[n];
float[] x = new float[n];
float[] y = new float[n];
float Fx, Fy;
float v;
int goalheight;


void setup() {
  size(1000, 800);

  Fx = 0;
  Fy = 0.3;
  v = 21;
  goalheight = 300;


  // 各円の初期位置と速度を設定
  for (int i = 0; i < n; i++) {
    x[i] = 100;
    y[i] = height - 100;
    float theta = map(i, 0, n, PI / 4, PI / 3); // thetaを0からPI/2まで変化させる
    vx[i] = cos(theta) * v; // vxを計算
    vy[i] = -sin(theta) * v; // vyを計算
  }
}

void draw() {
  background(0);
  stroke(255, 255, 0);
  line(width - 100, goalheight, width, goalheight);
  noStroke();
  for (int i = 0; i < n; i++) {
    vy[i] += Fy; // 力を加える
    x[i] += vx[i]; // 位置を更新
    y[i] += vy[i]; // 位置を更新

    // 境界条件を処理
    if (x[i] > width) {
      x[i] = width;
      vx[i] = -vx[i];
    }

    
    
    if(width - 100 <= x[i] && x[i] <= width){
      if (goalheight - 3 < y[i] && y[i] < goalheight + 3) {
        y[i] = goalheight;
        vy[i] = -vy[i] * 0; // バウンド後の速度を減少
        vx[i] *= 0; // 水平方向の速度も減少
      }
    }

    // ellipseを描画
    ellipse(x[i], y[i], 20, 20);
  }
}

void mouseClicked() {
  // マウスクリックで全ての円の速度にFxを加える
  for (int i = 0; i < 10; i++) {
    vx[i] += Fx;
  }
}

class Shapes {
  
  PShape createComb(float mx,float my,float r) {
    float angle=TWO_PI/6;
    PShape s=createShape();
    s.beginShape();
    float x;
    float y;
    float phi;
    for(int i=0;i<6;i++) {
      phi=-PI/2.0f+angle*i;
      x=r*sin(phi);
      y=r*cos(phi);
      s.vertex(x,y);
    }
    s.endShape(CLOSE);
    s.translate(mx,my);
    return s;
  }
}

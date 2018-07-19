class Art {
  PShape theShape;
  PShape layer1;
  PShape layer2;
  
  float layer1Space=20;
  float layer1Angle=0.25f*PI;
   float layer1Radius=10;
    float layer2Space=40;
     float layer2Radius=20;
  color layer1ColorBack=color(0,0,0);
   color layer1Color=color(200,0,0);
  float vFak=1.0;
  Shapes shapes=new Shapes();
  
  void createArt() {
    vFak=width/800.0f;
    theShape=createShape(GROUP);
   
    createLayer1();
    createLayer2();

  }
  
  
  void createLayer1() {
     layer1=createShape(GROUP);
     PShape r=createShape(RECT,0,0,width,height);
     r.setFill(layer1ColorBack);
     float space=layer1Space*vFak;
       float radius=layer1Radius*vFak;
     layer1.addChild(r);
     for(float x=space/2;x<width;x+=space) {
        for(float y=space/2;y<height;y+=space) {
          PShape c=createShape(ARC,x,y,radius,radius,0,TWO_PI);
          c.setFill(layer1Color);
          c.setStroke(false);
          layer1.addChild(c);
     }
     }
     theShape.addChild(layer1);
  }
  
  
  
   void createLayer2() {
     layer2=createShape(GROUP);
     theShape.addChild(layer2);
     int f;
       float radius=layer2Radius*vFak;
       f=0;
       float b=cos(TWO_PI/12)*radius;
        float a=radius-(1.0f/tan(PI*2/3))*b;
       println(a+","+radius+","+b);
      for(float x=a/2;x<width ;x+=a) {
        println(x);
        for(float y=b/2;y<height;y+=b*2) {
          PShape c=shapes.createComb(x,y+(f%2==0?0:b),radius);
          layer2.addChild(c);
        }
       f++; 
      }
  }
 void draw() {
    
    shape(theShape);
  }
  
  void draw(PGraphics pgDrawing,int w,int h) {
   
    pgDrawing.shape(theShape);
  }
}

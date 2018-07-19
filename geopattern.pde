import processing.svg.*;
import java.util.Date;

Art theArt=new Art();

void setup() {
    size(800,800,P2D);
     noLoop();
}

void draw() {
  background(255);
  theArt.createArt();
  theArt.draw();
   if (width>1000) {
     save((new Date().getTime())+".png");
      //saveAsSVG((new Date().getTime())+".svg",width,height);
     exit();
  }
}

void saveAsSVG(String fileName,int w,int h) {
  PGraphics pgDrawing;
pgDrawing = createGraphics(w, h, SVG, fileName);
  pgDrawing.beginDraw();
  pgDrawing.background(255);

  theArt.draw(pgDrawing,w,h);
  pgDrawing.dispose();
  pgDrawing.endDraw();
  pgDrawing.dispose();
}

int n = 0;
square mySquare = new square(0,150,150,0,0);
void setup(){
  size(1000,1000);
  fill(255);
  noStroke();
  colorMode(HSB,255);
}
void draw(){
  background(51);
  translate(500,500);
  mySquare.draw();
}
void mousePressed(){
 mySquare.split(); 
}
void keyPressed(){
 save("fractal"+(int)floor(random(100000))+".jpg");
}
final int nu = 3;
final float v = .5*sqrt(2);
class square{
  float x;float y;float w;
  square[] children = new square[nu];
  int c=0;
  float r;
  boolean dead =false;
  square(float nx,float ny,float nw,float nr,int nc){
  x=nx;y=ny;w=nw;r=nr;c=nc;
  }
  void draw(){
    translate(x,y);
    rotate(r);
    if(!dead){
      fill(c&255,255,255);
    rect(-w/2,-w/2,w,w);
    }else{
     for(int i=0;i<nu;i++){
      children[i].draw(); 
     }
    }
    rotate(-r);
    translate(-x,-y);
  }
  void split(){
    if(!dead){
    dead = true;
         children[0] = new square(0,0,w,0,c);
         children[1] = new square(-w/2,-w,w*v,radians(-45),c+20);
         children[2] = new square(+w/2,-w,w*v,radians(45),c+20);
    }else{
      for(int i=0;i<nu;i++){
      children[i].split(); 
     }
    }
  }
}

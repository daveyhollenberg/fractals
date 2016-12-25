int n = 0;
triangle mytriangle = new triangle(0,0,900);
void setup(){
  size(1000,1000);
  fill(255);
  noStroke();
}
void draw(){
  background(51);
  translate(500,500);
  mytriangle.draw();
}
void mousePressed(){
 mytriangle.split(); 
}
void keyPressed(){
 save("fractal.jpg");
}
class triangle{
  float x;float y;float w;
  triangle[] children = new triangle[3];
  int c=0;
  boolean dead =false;
  triangle(float nx,float ny,float nw){
  x=nx;y=ny;w=nw;
  }
  void draw(){
    if(!dead){
    triangle(x-w/2,y+w/2,x,y-w/2,x+w/2,y+w/2);
    }else{
     for(int i=0;i<3;i++){
      children[i].draw(); 
     }
    }
  }
  void split(){
    if(!dead){
    dead = true;
       children[0] = new triangle(x-w/4,y+w/4,w/2);
       children[2] = new triangle(x,y-w/4,w/2);
       children[1] = new triangle(x+w/4,y+w/4,w/2);
    }else{
      for(int i=0;i<3;i++){
      children[i].split(); 
     }
    }
  }
}

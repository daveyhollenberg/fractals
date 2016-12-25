int n = 0;
square mySquare = new square(0,0,900);
void setup(){
  size(1000,1000);
  fill(255);
  noStroke();
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
 save("fractal.jpg");
}
class square{
  float x;float y;float w;
  square[] children = new square[8];
  int c=0;
  boolean dead =false;
  square(float nx,float ny,float nw){
  x=nx;y=ny;w=nw;
  }
  void draw(){
    if(!dead){
    rect(x-w/2,y-w/2,w,w);
    }else{
     for(int i=0;i<8;i++){
      children[i].draw(); 
     }
    }
  }
  void split(){
    if(!dead){
    dead = true;
    for(int i=-1;i<2;i++){
      for(int j=-1;j<2;j++){
       if(abs(i)+abs(j)>0){
         children[c] = new square(x+w/3*i,y+w/3*j,w/3);
         c++;
       }
      }
    }
    }else{
      for(int i=0;i<8;i++){
      children[i].split(); 
     }
    }
  }
}

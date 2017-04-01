int n = 0;
float co;
square mySquare = new square(0,0,1800);
void setup(){
  size(2000,2000);
  fill(255);
  noStroke();
  colorMode(HSB);
}
void draw(){
  co=0;
  background(51);
  translate(1000,1000);
  mySquare.draw();
}
void mousePressed(){
 mySquare.split(); 
}
void keyPressed(){
 save("fractal1.jpg");
}
final int nu = 5;
class square{
  float x;float y;float w;
  square[] children = new square[nu];
  int c=0;
  boolean dead =false;
  square(float nx,float ny,float nw){
  x=nx;y=ny;w=nw;
  }
  void draw(){
    if(!dead){
      co+=1;
      fill(co%255,255,255);
    rect(x-w/2,y-w/2,w,w);
    }else{
     for(int i=0;i<nu;i++){
      children[i].draw(); 
     }
    }
  }
  void split(){
    if(!dead){
    dead = true;
    for(int i=-1;i<2;i++){
      for(int j=-1;j<2;j++){
       if(abs(i)+abs(j)<2){
         children[c] = new square(x+w/3*i,y+w/3*j,w/3);
         c++;
       }
      }
    }
    }else{
      for(int i=0;i<nu;i++){
      children[i].split(); 
     }
    }
  }
}

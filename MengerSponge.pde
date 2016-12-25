import peasy.*;
PeasyCam cam;
 cube mycube;
void setup(){
  size(1000,1000,P3D);
  mycube = new cube(0,0,0,100);
  cam = new PeasyCam(this,100);
}
void draw(){
 background(51);
   mycube.draw();
}
void keyPressed(){
  mycube.split();
}

class cube{
  cube[] children = new cube[60];
  float x;
  float y;
  float z;
  float size;
  byte ns = 0;
  boolean ex = false;
  cube(float nx, float ny,float nz, float nsize){
    x = nx;
    y = ny;
    z = nz;
    size = nsize;
    
  }
  void draw(){
    fill(204);
    pushMatrix();
    translate(x,y,z);
    if(!ex){box(size);}else{
     for(int i=0;i<ns;i++){
      children[i].draw(); 
     }
    }
    popMatrix();
  }
  void split(){
    if(!ex){
      ex=true;
     for(int i=-1;i<2;i++){
       for(int j=-1;j<2;j++){
         for(int k=-1;k<2;k++){
         if(abs(i)+abs(j)+abs(k)>=2){;
           children[ns] = new cube(i*size/3,j*size/3,k*size/3,size/3);
           ns++;
         }
         }
       }
     }
    }else{
      for(int i=0;i<ns;i++){
        children[i].split();
     }
    }
  }
  
}

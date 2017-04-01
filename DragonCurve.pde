int n = 0;
int l = 2;
byte[] path = new byte[999999999];
void setup(){
  size(1000,1000);
  fill(255);
  stroke(1);
  stroke(255,255);
  path[0] = 1;
  colorMode(HSB);
}
int s = 0;
void draw(){
  background(51);
  translate(700,400);
  int posx = 0;
  int posy = 0;
  int d = 0;
  float c=0;
    for(int i=0;i<n+1;i++){
      int xstep = 0;
      int ystep = 0;
      c+=255f/(n+1);
      stroke(c%255,255,255);
      if(path[i]==1){d--;}else{d++;}
      if(abs(d)%4==0){xstep=-l;ystep=0;}
      if(abs(d)%4==1){xstep=0;ystep=-l;}
      if(abs(d)%4==2){xstep=l;ystep=0;}
      if(abs(d)%4==3){xstep=0;ystep=l;}
      line(posx,posy,posx+xstep,posy+ystep);
      posx+=xstep;
      posy+=ystep;
    }
}
void mousePressed(){
  n++;
  path[n] = 1;
  s=n;
  for(int i=0;i<s;i++){
  n++;
  path[n]=path[i];
  if(i==s/2){
    if(path[n]==0){path[n]=1;}else{path[n]=0;}
    }
  }
}
void keyPressed(){
 save("fractal"+(int)floor(random(100000))+".jpg");
}

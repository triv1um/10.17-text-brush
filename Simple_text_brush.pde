
String txt;
PFont font;

char ch;
int index;


void setup() {
  size(1920, 1080);

  String[]lines=loadStrings("text.txt");
  println(lines.length);
  txt="";
  for (int i=0; i<lines.length; i++) {  
    txt+=lines[i];
  }
  
  txt=trim(txt);    
  println(txt.length());

  font=createFont("MSYH.TTC", 8);
  textFont(font);

  index=0;
  ch=txt.charAt(index);
  background(0);
}


void draw() {

  fill(255);

  float movement=dist(mouseX, mouseY, pmouseX, pmouseY);  
  
  if (mousePressed && movement>0) {         

    textSize(movement);                

    float angle=atan2(mouseY-pmouseY, mouseX-pmouseX);  //倾斜角度
    
    pushMatrix();
    translate(pmouseX, pmouseY);      
    rotate(angle);

    fill(255);
    ch=txt.charAt(index);
    text(ch, 0, 0);

    index++;
    if (index==txt.length())index=0;

    popMatrix();
  }
}

void keyPressed(){
  background(0);
}

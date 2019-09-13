PImage foto1,foto2,foto3,foto4,foto5,foto6;

int xBtn = 310;
int yBtn = 475;
int anBtn = 200;
int alBtn = 80;

final int mainMenu=0;

void setup()
{
  size(960,540);
  
  foto1 = loadImage("1.png");
  foto2 = loadImage("2.png");
  foto3 = loadImage("3.png");
  foto4 = loadImage("4.png");
  foto5 = loadImage("5.png");
  foto6 = loadImage("6.png");
  
}
void draw()
{
  switch(key) {
  case mainMenu:
  Menu();
    break;
  
  case 'e':
    Gameplay();
    break;
    
      case 'w':
    pantallaDos();
    break;
       case 'a':
    pantallaTres();
    break;
    
     case 'd':
    pantallaCuatro();
    break;
  }

}

void Menu(){
  
  background(foto1);
  
  //rect(xBtn,yBtn,anBtn,alBtn);
  
  if(mousePressed == true)
  {
    if(mouseX >xBtn && mouseX <xBtn + anBtn && mouseY >yBtn && mouseY <yBtn + alBtn)
    {
       println("esta adentro");
       setup();
    }
    
  }
}
void Gameplay()
{
  background(foto2);

}

void pantallaDos()
{
    background(foto3);

}

void pantallaTres()
{
    background(foto4);

}

void pantallaCuatro()
{
    background(foto5);

}

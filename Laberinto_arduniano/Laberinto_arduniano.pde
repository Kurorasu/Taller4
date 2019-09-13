import processing.serial.*;

Serial port;

// importar sonido de juego
 import processing.sound.*;
 SoundFile file;
 
 int Pantalla = 0;
 int time = 0;
 int velocidad = 30;
 int x;
 int y;
 int colorPelota = color(0);
 int tamano = 20;
 int leer;
 
 PImage fondo,pant1,pant2;
 

 
 void setup(){
   
  //tamaño de mapa
  size(800,800);
  
 port = new Serial(this,"COM5",9600);
  
  // sonido de juego
  file = new SoundFile (this, "Musica juego 2.wav");
  file.loop();


  // imagenes
  
  fondo = loadImage("fondo.png");
  pant1 = loadImage("pantalla 1.png");
  pant2 = loadImage("pantalla final.png");
  
  
  
  x = width/4;
  y = height/5;
  
  Reiniciar();
  
  
   
   
 }
 
 
 void draw(){
   
  background(255,255,255);
  
  
  //llamar a los rectangulos para el laberinto
  laberinto();
  
  
  //Inicio y final
  if (Pantalla == 0) {
    Comienzo();
  } else if (Pantalla == 1) {
    gameScreen();
  } else if (Pantalla == 2) {
    Final();
  }
}
  
  
  void dibujarJugador(){
    
   fill(colorPelota);
   
 leer = port.read();
   
   if (leer == 1) {
      x = x-5;
}  
   else if (leer == 2) {
      x = x+5;
}
    else if (leer == 3) {
      y = y+5;
}
    else if (leer == 4) {
      y = y-5;
    }


   rect(x,y,tamano,tamano);
   
   
   interactionKeyboard();
   
   
   
    
    
  }
   
   
 //dibuja tu laberinto aca
 
 void laberinto(){
   
  fill(0);
  rect(-9,-9,12,780);
  if(x+width/4 <= -9 || x >= -9+12 || y+height/4 <= -9 || y >= -9+780 ){
    }
    else{
      Reiniciar();
    }
    image(fondo,-89,-100,1000,1000);
  rect(796,-9,12,780);
 
  rect(-10, -10, 800, 12);
  rect(0, 735, 760, 4);
  rect(0, 765, 760, 4);
  rect(0, 795, 760, 4);
  rect(0, 700, 600, 4);
  rect(0, 700, 100, 4);
  rect(160, 700, 600, 4);
  rect(800, 700, 100, 4);
  rect(800, 504, 4, 200);
  rect(800, 504, 60, 4);
  rect(800, 0, 4, 440);
  rect(360, 50, 4, 490);
  rect(760, 624, 4, 80);
  rect(800, 510, 4, 190);
  rect(100, 514, 4, 190);
  rect(50, 464, 4, 240);
  rect(160, 650, 4, 50);
  rect(160, 646, 140, 4);
  rect(160, 600, 4, 50);
  rect(360, 646, 340, 4);
  rect(160, 595, 140, 4);
  rect(360, 596, 4, 50);
  rect(160, 464, 4, 80);
  rect(220, 464, 4, 80);
  rect(280, 464, 4, 80);
  rect(300, 544, 4, 55);
  rect(160, 540, 60, 4);
  rect(280, 540, 24, 4);
  rect(100, 460, 64, 4);
  rect(50, 224, 4, 185);
  rect(100, 54, 4, 405);
  rect(50, 220, 50, 4);
  rect(50, 0, 4, 165);
  rect(100, 50, 200, 4);
  rect(300, 110, 4, 300);
  rect(160, 110, 4, 290);
  rect(160, 400, 60, 4);
  rect(220, 400, 4, 64);
  rect(360, 50, 200, 4);
  rect(630, 50, 310, 4);
  rect(420, 220, 4, 374);
  rect(240, 110, 4, 240);
  rect(240, 350, 60, 4);
  rect(480, 160, 4, 440);
  rect(420, 100, 4, 60);
  rect(420, 160, 60, 4);
  rect(360, 594, 64, 4);
  rect(420, 100, 260, 4);
  rect(740, 100, 200, 4);
  rect(544, 160, 336, 4);
  rect(680, 100, 4, 60);
  rect(544, 440, 350, 4);
  rect(800, 440, 4, 200);
  rect(800, 504, 50, 4);
  rect(620, 510, 224, 4);
  rect(540, 440, 4, 160);
  rect(760, 570, 4, 100);
  rect(620, 570, 80, 4);
  rect(700, 570, 4, 80);
  rect(420, 380, 224, 4);
  rect(700, 300, 4, 140);
  rect(540, 320, 100, 4);
  rect(540, 220, 4, 100);
  rect(540, 220, 220, 4);
  rect(600, 270, 104, 4);
  rect(700, 270, 4, 100);
  rect(760, 220, 4, 164);
    if(x+width/4 <= 810 || x >= 810+4 || y+height/4 <= 230 || y >= 230+164 ){
      }
      else{
        Reiniciar();
      }
  rect(760, 700, 4, 164);
    if(x+width/4 <= 950 || x >= 950+4 || y+height/4 <= 700 || y >= 700+164 ){
      }
      else{
        Reiniciar();
      }
 }
 
 void Comienzo(){
   
   fill(#ffffff);
   background(0);
   image(pant1,-89,-100,1000,1000);
   textAlign(CENTER);
   //text("LABERINTO", height/2, width/2 -30);
   text("Click para empezar", height/2, width/2);
   
 }
 
 void gameScreen() {
  
  stroke(226, 204, 0);
  
  ganaste();
  dibujarJugador();
  
  
  //tiempo
  time= millis()/1000;
 text("Tiempo "+time, 710,790);
 
 
  
}

void Final() {
  background(0);
  image(pant2,-40,-100,900,1000);
  textAlign(CENTER);
  fill(255);
  textSize(30);
  text("Tu tiempo " + time, height/2, width/2 - 50);
  textSize(15);
  text("Click para reiniciar", height/2, width/2 + 10);
}
 
 void mousePressed() {
  if (Pantalla==0) {
    startGame();
  }
  if (Pantalla==2) {
    Reiniciar();
  }
  
  
}

void Reiniciar() {
  x=750;
  y=20;
  Pantalla = 0;
  time = 0;
}

void startGame() {
  Pantalla=1;
}

void interactionKeyboard(){
  
    if(keyPressed == true)
    {
      if(key == 'w')
      {
        y--;
      }
      
      if(key == 's')
      {
        y++;
      }
      if(key == 'd')
      {
        x++;
      }
      if(key == 'a')
      {
        x--;
      }
    }
  }

void ganaste(){
  
 // si toca suelo
 if (y+(tamano/2) > height){
  
   Pantalla = 2;
   Final();
   
 }
  
  
}

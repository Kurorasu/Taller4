int botonPin1 = 2;
int botonPin2 = 3;
int botonPin3 = 4;
int botonPin4 = 5;

int ledpin = 13;

int estadoPin1;
int estadoPin2;
int estadoPin3;
int estadoPin4;

int sensor;

void setup() {
  // put your setup code here, to run once:

  pinMode(botonPin1,INPUT);
  pinMode(botonPin2,INPUT);
  pinMode(botonPin3,INPUT);
  pinMode(botonPin4,INPUT);
  pinMode(ledpin,OUTPUT);

  Serial.begin(9600);

}

void loop() {
  // put your main code here, to run repeatedly:

  estadoPin1 = digitalRead(botonPin1);
  estadoPin2 = digitalRead(botonPin2);
  estadoPin3 = digitalRead(botonPin3);
  estadoPin4 = digitalRead(botonPin4);
  

  if(estadoPin1 == HIGH){

    digitalWrite(ledpin,HIGH);

    sensor = 1;
  }else  if(estadoPin2 == HIGH){

    digitalWrite(ledpin,HIGH);

    sensor = 2;
  }else if(estadoPin3 == HIGH){

    digitalWrite(ledpin,HIGH);

    sensor = 3;
  }else if(estadoPin4 == HIGH){

    digitalWrite(ledpin,HIGH);

    sensor = 4;
  }
  else {

    digitalWrite(ledpin,LOW);

    sensor = 0;
  }

  Serial.write(sensor);

  delay(50);

}

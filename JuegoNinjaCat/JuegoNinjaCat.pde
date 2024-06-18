private Escenario escenario;
private PImage fondo;
private int inicio=0;
private PImage titulo;
private PImage start;

public void setup(){
  size(640,480);
  escenario = new Escenario();
  escenario.setPosicion(new PVector (0,0));
  start=loadImage("Press Start.png");
  titulo=loadImage("TITLE.png");
  fondo=loadImage("Background.jpg");
}

public void draw(){
  background(0);
  if (inicio==0){
     pantallaInicio();  
   }else if (inicio==1){
     inicioJuego();
   }
}
public void pantallaInicio(){
  image(fondo, 0,0,640,480);
  image(titulo,170,100,300,50);
  image(start,170,400,300,50);
  
}
public void inicioJuego(){
  escenario.dibujar();
}
public void keyPressed(){
  if(inicio==0 && key==ENTER){
    inicio=1;
  } 
}

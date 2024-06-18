private Escenario escenario;
private PImage imagen;
private int inicio=0;

public void setup(){
  size(640,480);
  escenario = new Escenario();
  escenario.setPosicion(new PVector (0,0));
  imagen=loadImage("PantallaInicio.jpeg");
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
  image(imagen, 0,0,640,480);
  textSize(40);
  text("PRESIONE ENTER PARA EMPEZAR", 50, height/2);
  
}
public void inicioJuego(){
  escenario.dibujar();
}
public void keyPressed(){
  if(inicio==0 && key==ENTER){
    inicio=1;
  } 
}

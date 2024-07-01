private Escenario escenario;
private ManejadorDeObjetos manejadorObjetos;
private JoyPad joyPad;
private PImage fondo;
private int inicio=0;
private PImage titulo;
private PImage start;


public void setup(){
  size(640,480);
  escenario = new Escenario();
  escenario.setPosicion(new PVector (0,0));
  manejadorObjetos=new ManejadorDeObjetos();
  joyPad= new JoyPad();
  start=loadImage("Press Start.png");
  titulo=loadImage("TITLE.png");
  fondo=loadImage("PantallaInicio.jpeg");
 
}

public void draw(){
  background(0);
  if (inicio==0){
     verPantallaInicio();   //Muestra la pantalla de iniciopa
   }else if (inicio==1){
     iniciarJuego();  //Se inicia el juego
   }
}
public void verPantallaInicio(){
  image(fondo, 0,0,width,height);
  image(titulo,160,100,300,50);
  image(start,140,230,300,50);
  
}
public void iniciarJuego(){
  escenario.dibujar();
  //manejadorObjetos.mover();
  //JoyPad
  
  if(joyPad.isRightPressed()){
    escenario.personaje.mover(1);
  }
  if(joyPad.isLeftPressed()){
    escenario.personaje.mover(0);
  }
  escenario.personaje.aplicarGravedad();
 
}
public void keyPressed(){
  if(inicio==0 && key==ENTER){
    inicio=1;
    
  }else if (inicio==1){
    
    if (key=='a' || keyCode==LEFT){
      joyPad.setLeftPressed(true);
    }
    if (key=='d' || keyCode==RIGHT){
      joyPad.setRightPressed(true);
    }
    if (key==' ') {
      escenario.personaje.saltar();
    }
  }
}

public void keyReleased(){
    if (key== 'd' || keyCode==RIGHT){
      joyPad.setRightPressed(false);
  }
    if (key== 'a' || keyCode==LEFT){
      joyPad.setLeftPressed(false);
  }
}

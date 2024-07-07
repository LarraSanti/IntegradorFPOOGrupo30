private Escenario escenario;
//private ManejadorDeObjetos manejadorObjetos;
private JoyPad joyPad;
private int estado; //Indica en que estado se encuentra el juego
private PImage fondo;
private PImage titulo;
private PImage start;

public void setup(){
  size(640,480);
  estado= MaquinaDeEstados.INICIANDO;
  //manejadorObjetos=new ManejadorDeObjetos();
  joyPad= new JoyPad();
  start=loadImage("Press Start.png");
  titulo=loadImage("TITLE.png");
  fondo=loadImage("Background.jpg");

}

public void draw(){
  background(0);
  switch(estado){
    case MaquinaDeEstados.INICIANDO:
      verPantallaInicio();
      break;
    case MaquinaDeEstados.JUGANDO:
      iniciarJuego();
      break;
    case MaquinaDeEstados.GANANDO_PARTIDA:
      verPantallaVictoria();
      break;
    case MaquinaDeEstados.PERDIENDO_PARTIDA:
      verPantallaDerrota();
      break;
      
  }
}
public void verPantallaInicio(){
  image(fondo, 0,0,width,height);
  image(titulo,160,100,300,50);
  image(start,160,350,300,50);
  
}
public void verPantallaVictoria(){
  PImage victoria;
  victoria = loadImage("GANASTE.png");
  imageMode(CENTER);
  image(victoria,width/2,height/2);
   
}

public void verPantallaDerrota(){
  PImage derrota;
  derrota = loadImage("PERDISTE.png");
  imageMode(CENTER);
  image(derrota,width/2,height/2);
   
}

public void iniciarJuego(){
  escenario.dibujar();
  escenario.dibujarObjetos();
  
  if(joyPad.isRightPressed()){
    escenario.personaje.mover(1);
  }
  if(joyPad.isLeftPressed()){
    escenario.personaje.mover(0);
  }
  escenario.personaje.aplicarGravedad();
}
public void keyPressed(){
  if(keyCode==ENTER && (estado == MaquinaDeEstados.INICIANDO || estado == MaquinaDeEstados.PERDIENDO_PARTIDA || estado == MaquinaDeEstados.GANANDO_PARTIDA)){
    estado = MaquinaDeEstados.JUGANDO;
    escenario = new Escenario();
    escenario.setPosicion(new PVector (0,0));
  } 
  if (key=='a' || keyCode==LEFT && estado==MaquinaDeEstados.JUGANDO){
      joyPad.setLeftPressed(true);
  }
  if (key=='d' || keyCode==RIGHT && estado==MaquinaDeEstados.JUGANDO){
      joyPad.setRightPressed(true);
  }
  if (key==' ' && estado==MaquinaDeEstados.JUGANDO) {
      escenario.personaje.saltar();
  }
  if(key=='f' && (estado == MaquinaDeEstados.JUGANDO)){
    estado = MaquinaDeEstados.PERDIENDO_PARTIDA;
  }
  if(key=='g' && (estado == MaquinaDeEstados.JUGANDO)){
    estado = MaquinaDeEstados.GANANDO_PARTIDA;
  }
}
public void keyReleased(){
    if (key== 'd' || keyCode==RIGHT && estado==MaquinaDeEstados.JUGANDO){
      joyPad.setRightPressed(false);
  }
    if (key== 'a' || keyCode==LEFT && estado==MaquinaDeEstados.JUGANDO){
      joyPad.setLeftPressed(false);
  }
 
}

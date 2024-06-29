private Escenario escenario;
private ManejadorDeObjetos manejadorObjetos;
private BonusSushi sushi;
private Shuriken shuriken;
private BaldeAgua baldeAgua;
private PerroMadera perroMadera;
private PImage fondo;
private int inicio=0;
private PImage titulo;
private PImage start;


public void setup(){
  size(640,480);
  escenario = new Escenario();
  escenario.setPosicion(new PVector (0,0));
  manejadorObjetos=new ManejadorDeObjetos();
  sushi=new BonusSushi(new PVector(0,0));
  shuriken= new Shuriken(new PVector(0,0));
  baldeAgua= new BaldeAgua(new PVector(0,0));
  perroMadera= new PerroMadera(new PVector(0,0));
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
  image(fondo, 0,0,640,480);
  image(titulo,160,100,300,50);
  image(start,140,230,300,50);
  
}
public void iniciarJuego(){
  escenario.dibujar();
  manejadorObjetos.mover(sushi);
  manejadorObjetos.mover(shuriken);
  manejadorObjetos.mover(baldeAgua);
  manejadorObjetos.mover(perroMadera);
}
public void keyPressed(){
  if(inicio==0 && key==ENTER){
    inicio=1;
  } 
}
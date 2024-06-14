private Escenario escenario;

public void setup(){
  size(640,480);
  escenario = new Escenario();
  escenario.setPosicion(new PVector (0,0));
}

public void draw(){
   background(0);
   escenario.dibujar();
}

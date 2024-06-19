class Escenario{
  //Atributos
  private PImage imagen;
  private Objeto objetos;
  private Personaje personaje;
  private PVector posicion;
  private HUD hud;
  
  //Constructores
  public Escenario(){
    imagen=loadImage("Background.jpg");
  }
  //Constructor parametrizado
  public Escenario(PVector posicion){
    this.posicion = posicion;
  }
  
  //Metodos
  public void dibujar(){
    image(imagen,posicion.x,posicion.y, 640,480);
  }
  
  //Metodos accesores
   public void setPosicion(PVector posicion){
    this.posicion=posicion; 
  }
  
}

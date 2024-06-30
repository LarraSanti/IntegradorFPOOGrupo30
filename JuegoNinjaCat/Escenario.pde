class Escenario{
  //Atributos
  private PVector posicion;
  private PImage imagen;
  private Objeto objetos;
  private Personaje personaje;
  
  private HUD hud;
  
  //Constructores
  public Escenario(){
    imagen=loadImage("Background.jpg");
    personaje= new Personaje();
    personaje.setPosicion(new PVector(width/2, height-90));
    personaje.setVelocidad(new PVector(5,5));
    
  }
  //Constructor parametrizado
  public Escenario(PVector posicion){
    this.posicion = posicion;
  }
  
  //Metodos
  public void dibujar(){
    image(imagen,this.posicion.x, this.posicion.y, width, height+20);
    personaje.display();
  }
 
  
  //Metodos accesores
   public void setPosicion(PVector posicion){
    this.posicion=posicion; 
  }
  
}

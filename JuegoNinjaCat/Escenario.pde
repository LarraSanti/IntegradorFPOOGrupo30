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
    personaje= new Personaje();
    personaje.setPosicion(new PVector(width/2, height-90));
    
  }
  //Constructor parametrizado
  public Escenario(PVector posicion){
    this.posicion = posicion;
  }
  
  //Metodos
  public void dibujar(){
    image(imagen,this.posicion.x, this.posicion.y, width, height);
    personaje.display();
  }
  
  //Metodos accesores
   public void setPosicion(PVector posicion){
    this.posicion=posicion; 
  }
  
}

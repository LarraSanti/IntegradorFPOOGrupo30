class Escenario{
  //Atributos
  private PImage imagen;
  private Objeto objetos;
  private Personaje personaje;
  private PVector posicion;
  
  //Constructores
  public Escenario(){
    imagen=loadImage("Background.jpg");
  }
  
  public Escenario(PVector posicion){
    this.posicion = posicion;
  }
  
  //Metodos
  public void dibujar(){
    image(imagen,posicion.x,posicion.y, 640,480);
  }
  
  public void obtenerPuntaje(){
  
  }
  
  //Metodos accesores
   public void setPosicion(PVector posicion){
    this.posicion=posicion; 
  }
  
}

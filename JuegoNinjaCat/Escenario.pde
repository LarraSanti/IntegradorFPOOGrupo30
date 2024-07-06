class Escenario{
  //Atributos
  private PVector posicion;
  private PImage imagen;
  private ArrayList<Objeto> objetos;
  //private Personaje personaje;
  //private Hud hud; 
  
  
  //Constructores
  public Escenario(){
    imagen=loadImage("Background.jpg");
  }
  
  public Escenario(PVector posicion){
    this.posicion = posicion;
  }
  
  //Metodos
  public void dibujar(){
    image(imagen,this.posicion.x,this.posicion.y, width,height+25);
  }
  
  //Metodos accesores
   public void setPosicion(PVector posicion){
    this.posicion=posicion; 
  }
  
}

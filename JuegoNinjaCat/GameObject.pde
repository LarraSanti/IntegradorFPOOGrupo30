abstract class GameObject {
  //Atributos
  protected PVector posicion; 
  protected PImage imagen; 
  protected PVector velocidad; 
  
  //Constructores
  public GameObject(){
  
  }
  //Constructor parametrizado
  public GameObject(PVector posicion, PVector velocidad) {
    this.posicion = posicion;
    this.velocidad = velocidad;
  }
  
  //Métodos
  public abstract void mover(int direccion);
}

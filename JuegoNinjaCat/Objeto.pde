abstract class Objeto extends GameObject{
  private PVector direccion;
  private PVector velocidad
  //Métodos
  public abstract void mover();
  
  //Métodos accesores
  public void setPosicion(PVector posicion){
    this.posicion=posicion; 
  }
  
  public void setVelocidad(PVector velocidad){
    this.velocidad = velocidad;   
  }
  
}

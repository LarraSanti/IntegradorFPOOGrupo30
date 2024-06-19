abstract class Objeto extends GameObject{
  //Atributos
  protected PVector direccion;
  
  //Constructor por defecto
  public Objeto(){
  }
  //Constructor parametrizado
  public Objeto(PVector direccion){
    this.direccion=direccion;
    
  }
  //Método abstracto
  public abstract PVector mover();
  
  //Métodos accesores
  public void setPosicion(PVector posicion){
    this.posicion=posicion; 
  }
  public void setVelocidad(PVector velocidad){
    this.velocidad = velocidad;   
  }
  
}

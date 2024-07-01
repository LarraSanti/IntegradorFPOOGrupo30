abstract class Objeto extends GameObject implements IVisualizable{
  //Atributos
  protected PVector direccion;
  
  //Constructor por defecto
  public Objeto(){
  }
  //Constructor parametrizado
  public Objeto(PVector direccion){
    this.direccion=direccion;
    
  }
  
  //por la interfaz
  public void dibujar(){
  
  }
  //Método abstracto
  public abstract void mover(int direccion);
  
  //Métodos accesores
  public void setPosicion(PVector posicion){
    this.posicion=posicion; 
  }
  public void setVelocidad(PVector velocidad){
    this.velocidad = velocidad;   
  }
  
}

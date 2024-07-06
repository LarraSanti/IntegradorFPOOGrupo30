abstract class Objeto implements IVisualizable{
  protected ImageComponent imageComponent;
  protected Transform transform;
  protected PVector velocidad;
  
  //Constructores 
  
  //Métodos
  public abstract void mover();
  
  //por la interfaz
  public void dibujar(){
  }
 
  
}

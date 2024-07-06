class Personaje implements IVisualizable{
  //Atributos
  private Transform transform;
  private ImageComponent imageComponent;
  private int experiencia; 
  private int vida; 
  private PVector velocidad;
  //Constructores
  public Personaje(){
  }
  //Constructores Parametrizados
  
  public Personaje(Transform transform, ImageComponent imageComponent){
    this.transform=transform;
    this.imageComponent=imageComponent;
  }
  public Personaje(Transform transform, ImageComponent imageComponent, PVector velocidad){
    this.transform=transform;
    this.imageComponent=imageComponent;
    this.velocidad=velocidad;
  }
   public Personaje(Transform transform, ImageComponent imageComponent, PVector velocidad, int experiencia, int vida){
    this.transform=transform;
    this.imageComponent=imageComponent;
    this.velocidad=velocidad;
    this.experiencia=experiencia;
    this.vida=vida;
  }
  
  //Métodos
  
  public void display(){
    this.imageComponent.displayImage(transform.getPosition(),100,100);
  }
  public void mover(){
  }
  
  public void deslizar(){
  }
   
   
  //Métodos Accesores
  public void setVelocidad(PVector velocidad){
    this.velocidad = velocidad;   
  }
}

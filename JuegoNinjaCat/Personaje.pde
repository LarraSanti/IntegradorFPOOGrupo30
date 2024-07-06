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
    this.imageComponent.displayImage(transform.getPosicion(),100,100);
  }
  
  //Mueve la posicion, hacia la izquierda o derecha, segun lo que se indique en el atributo velocidad
  //direccion (0:izquierda;1:derecha)
  public void mover(int direccion){
    switch(direccion){
      case 0:{
        this.transform.getPosicion().x-=(this.velocidad.x*Time.getDeltaTime(frameRate));
        if(this.transform.getPosicion().x<-100){
          this.transform.getPosicion().x=width;
        }
        break;
        
      }
      case 1: {
        this.transform.getPosicion().x+=(this.velocidad.x *Time.getDeltaTime(frameRate));
        if (this.transform.getPosicion().x>width){
          this.transform.getPosicion().x=-100;
        }
        break;
      }
    }
  }
  
  public void deslizar(){
  }
   
   
  //Métodos Accesores
  public void setVelocidad(PVector velocidad){
    this.velocidad = velocidad;   
  }
}

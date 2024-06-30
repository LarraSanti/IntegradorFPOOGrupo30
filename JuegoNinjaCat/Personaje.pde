class Personaje extends GameObject{
  //Atributos
  private int experiencia; 
  private int vida; 
  
  //Constructores
  public Personaje(){
    imagen= loadImage("NinjaCat.png");
  }
  public Personaje(PVector posicion, PVector velocidad, int experiencia, int vida){
    super(posicion, velocidad);
    this.experiencia=experiencia;
    this.vida=vida;
  }
  
  //Métodos
  
  public void display(){
    image(imagen, this.posicion.x, this.posicion.y,100,100);
  }
  
  //Mueve la posicion, hacia la izquierda o derecha, segun lo que se indique en el atributo velocidad
  //direccion (3:izquierda;1:derecha)
 
  public void mover(int direccion){
    switch(direccion){
      case 1:{
        this.posicion.x+=this.velocidad.x;
        if (this.posicion.x>width){
          this.posicion.x=-100;
        }
        break;
      }
      case 3: {
        this.posicion.x-=this.velocidad.x;
        if(this.posicion.x<-100){
          this.posicion.x=width;
        }
        break;
      }
    }    
  }

  public void deslizar(){
  }
   
  //Métodos Accesores
  public void setPosicion(PVector posicion){
    this.posicion=posicion; 
  }
  public PVector getPosicion(){
    return this.posicion;
  }
  public void setVelocidad(PVector velocidad){
    this.velocidad = velocidad;   
  }
  public PVector getVelocidad(){
    return this.velocidad;
  }
  public void setExperiencia(int experiencia){
    this.experiencia=experiencia;
  }
  public int getExperiencia(){
    return this.experiencia;
  }
  public void setVida(int vida){
    this.vida=vida;
  }
  public int getVida(){
    return this.vida;
  }
}

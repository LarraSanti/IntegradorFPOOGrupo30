class Personaje extends GameObject implements IVisualizable{
  //Atributos
  private int experiencia;   //Indica la experiencia que ha obtenido el personaje
  private int vida;  //Indica cuanta vida tiene el personaje
  private boolean isJumping;  //Indica si el personaje está saltando o no
  private float velocidadVertical; //Determina su movimiento hacia arriba o hacia abajo
  private float gravedad;  //Es la aceleración hacia abajo debida a la gravedad, que afecta la caída del personaje. Modificar este valor afectará la velocidad con la que el personaje cae:
  private float impulso;   //El impulso que se aplica al saltar para que el personje suba
  
  //Constructores
  public Personaje(){
    imagen= loadImage("NinjaCat.png");
    isJumping=false;
    velocidadVertical=0; 
    gravedad=1.0;
    impulso=-20;
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
  //direccion (0:izquierda;1:derecha)
 
  public void mover(int direccion){
    switch(direccion){
      case 0:{
        this.posicion.x-=this.velocidad.x;
        if(this.posicion.x<-100){
          this.posicion.x=width;
        }
        break;
        
      }
      case 1: {
        this.posicion.x+=this.velocidad.x;
        if (this.posicion.x>width){
          this.posicion.x=-100;
        }
        break;
      }
    }    
  }
  
  
  public void saltar(){
    if (!isJumping) {
      isJumping= true;
      velocidadVertical = impulso;
    }
  }
  
  //Simula la gravedad cuando está en el aire.
  public void aplicarGravedad(){

    //Aplicar gravedad
    if (isJumping) { //Si está saltando
      velocidadVertical += gravedad;  // Incrementa la velocidad vertical con la gravedad
      this.posicion.y += velocidadVertical;  //Actualiza la posicion y del personaje segun la velocidad vertical

  //Verifica si el personaje tocó el piso
      if (this.posicion.y >= height - 90) {
        this.posicion.y = height - 90;  //La posicion y del personaje será el piso, donde esyaba inicialmente
        velocidadVertical = 0;  //La velocidad vertical será cero, se detiene
        isJumping = false;   //El personje ya no está saltando, está en el piso
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

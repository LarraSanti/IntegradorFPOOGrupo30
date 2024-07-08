class Personaje implements IVisualizable {
  private Transform transform;
  private ImageComponent imageComponent;
  private int experiencia; 
  private int vida; 
  private PVector velocidad;
  private boolean isJumping;
  private float velocidadVertical;
  private float gravedad;
  private float impulso;
  private Colisionador colisionador;
  
  public Personaje(){ 
  }
  
  public Personaje(Transform transform, ImageComponent imageComponent){
    this.transform = transform;
    this.imageComponent = imageComponent;
    this.colisionador = new Colisionador(transform.getPosicion(), 50);
    this.vida = 100;
  }

  public Personaje(Transform transform, ImageComponent imageComponent, PVector velocidad){
    this.transform = transform;
    this.imageComponent = imageComponent;
    this.velocidad = velocidad;
    this.colisionador = new Colisionador(transform.getPosicion(), 50);
    this.vida = 100; 
  }

  public Personaje(Transform transform, ImageComponent imageComponent, PVector velocidad, int experiencia, int vida){
    this.transform = transform;
    this.imageComponent = imageComponent;
    this.velocidad = velocidad;
    this.experiencia = experiencia;
    this.vida = vida;
    this.isJumping = false;
    this.velocidadVertical = 0; 
    this.gravedad = 1.0;
    this.impulso = -20;
    this.colisionador = new Colisionador(transform.getPosicion(), 50);
  }
  
  public void display(){
    this.imageComponent.displayImage(transform.getPosicion(), 100, 100);
  }
  
  public void mover(int direccion){
    switch(direccion){
      case 0:{
        this.transform.setPosicion(new PVector(
          this.transform.getPosicion().x - (this.velocidad.x * Time.getDeltaTime(frameRate)),
          this.transform.getPosicion().y
        ));
        if(this.transform.getPosicion().x < -100){
          this.transform.setPosicion(new PVector(width, this.transform.getPosicion().y));
        }
        break;
      }
      case 1: {
        this.transform.setPosicion(new PVector(
          this.transform.getPosicion().x + (this.velocidad.x * Time.getDeltaTime(frameRate)),
          this.transform.getPosicion().y
        ));
        if (this.transform.getPosicion().x > width){
          this.transform.setPosicion(new PVector(-100, this.transform.getPosicion().y));
        }
        break;
      }
    }
    this.colisionador.setPosicion(this.transform.getPosicion());
  }
  
  public void saltar(){
    if (!isJumping) {
      isJumping = true;
      velocidadVertical = impulso;
    }
  }
  
  public void aplicarGravedad(){
    if (isJumping) {
      velocidadVertical += gravedad;
      this.transform.setPosicion(new PVector(
        this.transform.getPosicion().x,
        this.transform.getPosicion().y + velocidadVertical
      ));
      if (this.transform.getPosicion().y >= height - 90) {
        this.transform.setPosicion(new PVector(
          this.transform.getPosicion().x,
          height - 90
        ));
        velocidadVertical = 0;
        isJumping = false;
      }
    }
    this.colisionador.setPosicion(this.transform.getPosicion());
  }

  public Colisionador getColisionador() {
    return this.colisionador;
  }
  
  public void deslizar(){
  }

  public void setVelocidad(PVector velocidad){
    this.velocidad = velocidad;   
  }
  public PVector getVelocidad(){
    return this.velocidad;
  }
  public void setExperiencia(int experiencia){
    this.experiencia = experiencia;
  }
  public int getExperiencia(){
    return this.experiencia;
  }
  public void setVida(int vida){
    this.vida = vida;
  }
  public int getVida(){
    return this.vida;
  }

  public void reducirVida(int cantidad) {
    this.vida -= cantidad;
    if (this.vida < 0) {
      this.vida = 0;
    }
  }
}

class Personaje implements IVisualizable {
  private Transform transform; 
  private ImageComponent imageComponent; 
  private int experiencia; // Experiencia del personaje
  private int vida; 
  private PVector velocidad;
  private boolean isJumping; // Estado de salto del personaje
  private float velocidadVertical; // Velocidad vertical para el salto
  private float gravedad; // Gravedad aplicada al personaje
  private float impulso; // Fuerza del impulso al saltar
  private Colisionador colisionador; 

  // Constructor por defecto
  public Personaje() { 
  }

  // Constructor que inicializa transform y imageComponent
  public Personaje(Transform transform, ImageComponent imageComponent) {
    this.transform = transform;
    this.imageComponent = imageComponent;
    this.colisionador = new Colisionador(transform.getPosicion(), 50);
    this.vida = 100;
  }

  // Constructor que inicializa transform, imageComponent y velocidad
  public Personaje(Transform transform, ImageComponent imageComponent, PVector velocidad) {
    this.transform = transform;
    this.imageComponent = imageComponent;
    this.velocidad = velocidad;
    this.colisionador = new Colisionador(transform.getPosicion(), 50);
    this.vida = 100; 
  }

  // Constructor completo con todos los atributos inicializados
  public Personaje(Transform transform, ImageComponent imageComponent, PVector velocidad, int experiencia, int vida) {
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

  // Método para mostrar la imagen del personaje en la pantalla
  public void display() {
    this.imageComponent.displayImage(transform.getPosicion(), 100, 100);
  }

  // Método para mover el personaje en la dirección especificada
  public void mover(int direccion) {
    switch (direccion) {
      case 0: { // Mover a la izquierda
        this.transform.setPosicion(new PVector(
          this.transform.getPosicion().x - (this.velocidad.x * Time.getDeltaTime(frameRate)),
          this.transform.getPosicion().y
        ));
        if (this.transform.getPosicion().x < -100) {
          this.transform.setPosicion(new PVector(width, this.transform.getPosicion().y));
        }
        break;
      }
      case 1: { // Mover a la derecha
        this.transform.setPosicion(new PVector(
          this.transform.getPosicion().x + (this.velocidad.x * Time.getDeltaTime(frameRate)),
          this.transform.getPosicion().y
        ));
        if (this.transform.getPosicion().x > width) {
          this.transform.setPosicion(new PVector(-100, this.transform.getPosicion().y));
        }
        break;
      }
    }
    this.colisionador.setPosicion(this.transform.getPosicion());
  }

  // Método para hacer que el personaje salte
  public void saltar() {
    if (!isJumping) {
      isJumping = true;
      velocidadVertical = impulso;
    }
  }

  // Método para aplicar la gravedad al personaje mientras está saltando
  public void aplicarGravedad() {
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

  // Getter para obtener el colisionador del personaje
  public Colisionador getColisionador() {
    return this.colisionador;
  }

   // Método para reducir la vida del personaje
  public void reducirVida(int cantidad) {
    this.vida -= cantidad;
    if (this.vida < 0) {
      this.vida = 0;
    }
  }
  
  //Método para reducir la experiencia del personaje
  public void reducirExperiencia(int cantidad) {
    this.experiencia -= cantidad;
    if (this.experiencia < 0) {
      this.experiencia = 0;
  }
  }
  
  //Método para aumentar la experiencia del personaje
  public void aumentarExperiencia(int cantidad){
    this.experiencia+=cantidad;
    if (this.experiencia>200){
      println("Partida Completada/Ganada");
    }
  }

  // Setters y getters para velocidad, experiencia y vida
  public void setVelocidad(PVector velocidad) {
    this.velocidad = velocidad;   
  }

  public PVector getVelocidad() {
    return this.velocidad;
  }

  public void setExperiencia(int experiencia) {
    this.experiencia = experiencia;
  }

  public int getExperiencia() {
    return this.experiencia;
  }

  public void setVida(int vida) {
    this.vida = vida;
  }

  public int getVida() {
    return this.vida;
  }
}

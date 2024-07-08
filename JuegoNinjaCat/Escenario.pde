class Escenario {
  // Atributos privados de la clase
  private PVector posicion; 
  private PImage imagen; 
  private ManejadorDeObjetos manejadorObjetos; 
  private Personaje personaje; 
  private Hud hud; // Interfaz de usuario para mostrar información del personaje
  
  // Constructor por defecto del escenario
  public Escenario() {
    // Cargar imagen de fondo
    imagen = loadImage("Background.jpeg");
    // Establecer la tasa de cuadros por segundo
    frameRate(80);
    
    // Inicializar el personaje
    Transform transformPersonaje = new Transform(new PVector(width / 2, height - 90));
    ImageComponent imagePersonaje = new ImageComponent("NinjaCat.png");
    personaje = new Personaje(transformPersonaje, imagePersonaje, new PVector(320, 0), 0, 7);
    
    // Inicializar el manejador de objetos y el HUD
    manejadorObjetos = new ManejadorDeObjetos();
    hud = new Hud();
  }
  
  // Constructor que recibe la posición del escenario
  public Escenario(PVector posicion) {
    this.posicion = posicion;
  }

  // Método para dibujar el escenario
  public void dibujar() {
    image(imagen, this.posicion.x, this.posicion.y, width, height + 25);
    
    // Mostrar el personaje y la interfaz HUD
    personaje.display();
    hud.mostrarVida(personaje);
    hud.mostrarExperiencia(personaje);
    hud.mostrarNivelActual();
  }

  // Método para agregar objetos al escenario
  public void agregarObjetos() {
    manejadorObjetos.agregarObjetos();
  }

  // Método para establecer la posición del escenario
  public void setPosicion(PVector posicion) {
    this.posicion = posicion;
  }
}

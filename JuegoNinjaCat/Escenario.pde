class Escenario {
  private PVector posicion;
  private PImage imagen;
  private ManejadorDeObjetos manejadorObjetos;
  private Personaje personaje;
  private Hud hud; 
  
  public Escenario() {
    imagen=loadImage("Background.jpeg");
    frameRate(80);
    Transform transformPersonaje = new Transform(new PVector(width / 2, height - 90));
    ImageComponent imagePersonaje = new ImageComponent("NinjaCat.png");
    personaje = new Personaje(transformPersonaje, imagePersonaje, new PVector(320, 0), 0, 7);
    manejadorObjetos = new ManejadorDeObjetos();
    hud = new Hud();
  }
  
  public Escenario(PVector posicion) {
    this.posicion = posicion;
  }

  public void dibujar() {
    image(imagen, this.posicion.x, this.posicion.y, width, height + 25);
    personaje.display();
    hud.mostrarVida(personaje);
    hud.mostrarExperiencia(personaje);
    hud.mostrarNivelActual();
  }

  public void agregarObjetos() {
    manejadorObjetos.agregarObjetos();
  }

  public void setPosicion(PVector posicion) {
    this.posicion = posicion;
  }
}

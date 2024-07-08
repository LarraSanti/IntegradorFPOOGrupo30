class Hud {
  private PFont font; // Fuente de texto utilizada en el HUD
  private int tamañoLetra; // Tamaño de la letra utilizada en el HUD

  // Constructor del HUD, inicializa la fuente y el tamaño de la letra
  public Hud(){
    font = loadFont("TempusSansITC-48.vlw");
    tamañoLetra = 25;
  }

  // Muestra el nivel actual del personaje en la pantalla
  public void mostrarNivelActual(){
    textAlign(CENTER);
    textSize(tamañoLetra);
    text("Nivel: 1", width - 100, 30); 
  }

  // Muestra la vida del personaje en la pantalla
  public void mostrarVida(Personaje personaje){  
    textFont(font);
    textAlign(CENTER);
    textSize(tamañoLetra);
    text("Vida: " + personaje.getVida(), 90, 30);
  }

  // Muestra la experiencia del personaje en la pantalla
  public void mostrarExperiencia(Personaje personaje){
    textAlign(CENTER);
    textSize(tamañoLetra);
    text("Experiencia: " + personaje.getExperiencia(), width / 2, 30);
  }
}

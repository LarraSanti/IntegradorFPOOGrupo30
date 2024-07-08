class Hud {
  private PFont font;
  private int tamañoLetra;

  public Hud(){
    font = loadFont("TempusSansITC-48.vlw");
    tamañoLetra = 25;
  }

  public void mostrarNivelActual(){
    textAlign(CENTER);
    textSize(tamañoLetra);
    text("Nivel: 1 ", width-100, 30); 
  }

  public void mostrarVida(Personaje personaje){  
    textFont(font);
    textAlign(CENTER);
    textSize(tamañoLetra);
    text("Vida: "+ personaje.getVida(), 90, 30);
  }

  public void mostrarExperiencia(Personaje personaje){
    textAlign(CENTER);
    textSize(tamañoLetra);
    text("Experiencia: "+ personaje.getExperiencia(), width/2, 30);
  }
}

import ddf.minim.*; // library Minim importada


// Variables globales
private Escenario escenario; 
private JoyPad joyPad;
private int estado; 
private PImage fondo; // Imagen de fondo para la pantalla de inicio
private Minim minim; // Para la música del juego
AudioPlayer player; // Reproductor de música

public void setup() {
  size(640, 480); // Establece el tamaño de la ventana del juego
  estado = MaquinaDeEstados.INICIANDO; // Estado inicial del juego
  joyPad = new JoyPad(); // Inicializa el controlador del jugador
  fondo = loadImage("PantallaInicio.png"); 
  
  minim = new Minim(this); // Inicializa Minim para la música
  player = minim.loadFile("musicNinjaCat.mp3"); // Carga la música
  player.loop(); // Reproduce la música en bucle
  player.setGain(-14); // Ajusta el volumen
}

public void draw() {
  background(0); // Fondo negro por defecto
  switch (estado) {
    case MaquinaDeEstados.INICIANDO:
      verPantallaInicio();
      break;
    case MaquinaDeEstados.JUGANDO:
      iniciarJuego(); 
      break;
    case MaquinaDeEstados.GANANDO_PARTIDA:
      verPantallaVictoria(); 
      break;
    case MaquinaDeEstados.PERDIENDO_PARTIDA:
      verPantallaDerrota();
      break;
  }
}

public void verPantallaInicio() {
  player.pause(); // Pausa la música en la pantalla de inicio
  image(fondo, 0, 0, width, height); // Muestra la imagen de fondo
}

public void verPantallaVictoria() {
  PImage victoria = loadImage("GANASTE.png");
  PImage restart = loadImage("EMPEZARDENUEVO.png");
  image(victoria, 100, 120); // Muestra la imagen de victoria
  image(restart, 25, 350, 600, 50); // Muestra el botón de reinicio
}

public void verPantallaDerrota() {
  PImage derrota = loadImage("PERDISTE.png");
  PImage reintentar = loadImage("REINTENTAR.png");
  image(derrota, 100, 120); // Muestra la imagen de derrota
  image(reintentar, 25, 350, 600, 50); // Muestra el botón de reintentar
}

public void iniciarJuego() {
  player.play(); // Reproduce la música en el juego
  escenario.dibujarEscenario(); 
  escenario.dibujarObjetos();
  escenario.personaje.display();
  escenario.verificarColisiones();
 
  //Establece la condicion para que aparezca la pantalla de derrota
  if(escenario.personaje.getVida()<=0 && estado==MaquinaDeEstados.JUGANDO){
    estado=MaquinaDeEstados.PERDIENDO_PARTIDA;
    player.pause();
}
  //Establece la condicion para que aparezca la pantalla de victoria
  if(escenario.personaje.getExperiencia()>=200 && estado==MaquinaDeEstados.JUGANDO){
    estado=MaquinaDeEstados.GANANDO_PARTIDA;
    player.pause();
  }
  
  
  // Movimiento del personaje basado en el JoyPad
  if (joyPad.isRightPressed()) {
    escenario.personaje.mover(1);
  }
  if (joyPad.isLeftPressed()) {
    escenario.personaje.mover(0);
  }
  escenario.personaje.aplicarGravedad(); // Aplica gravedad al personaje
}

public void keyPressed() {
  if (keyCode == ENTER && (estado == MaquinaDeEstados.INICIANDO || estado == MaquinaDeEstados.PERDIENDO_PARTIDA || estado == MaquinaDeEstados.GANANDO_PARTIDA)) {
    estado = MaquinaDeEstados.JUGANDO; // Cambia el estado a jugando
    escenario = new Escenario(); // Inicializa un nuevo escenario
    escenario.setPosicion(new PVector(0, 0)); // Establece la posición inicial del escenario
  }
  // Control del JoyPad
  if ((key == 'a' || keyCode == LEFT) && estado == MaquinaDeEstados.JUGANDO) {
    joyPad.setLeftPressed(true);
  }
  if ((key == 'd' || keyCode == RIGHT) && estado == MaquinaDeEstados.JUGANDO) {
    joyPad.setRightPressed(true);
  }
  if (key == ' ' && estado == MaquinaDeEstados.JUGANDO) {
    escenario.personaje.saltar();
  }
  // Controles para cambiar el estado del juego manualmente
  if (key == 'f' && estado == MaquinaDeEstados.JUGANDO) {
    estado = MaquinaDeEstados.PERDIENDO_PARTIDA;
  }
  if (key == 'g' && estado == MaquinaDeEstados.JUGANDO) {
    estado = MaquinaDeEstados.GANANDO_PARTIDA;
  }
}

public void keyReleased() {
  // Libera las teclas del JoyPad
  if ((key == 'd' || keyCode == RIGHT) && estado == MaquinaDeEstados.JUGANDO) {
    joyPad.setRightPressed(false);
  }
  if ((key == 'a' || keyCode == LEFT) && estado == MaquinaDeEstados.JUGANDO) {
    joyPad.setLeftPressed(false);
  }
}

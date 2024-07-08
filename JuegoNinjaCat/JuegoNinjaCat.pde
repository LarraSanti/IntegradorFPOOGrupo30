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
  imageMode(CENTER);
  image(victoria, width / 2, height / 2); 
  image(restart, width / 2, 400, 600, 50); // Muestra el botón de reinicio
}

public void verPantallaDerrota() {
  PImage derrota = loadImage("PERDISTE.png");
  PImage reintentar = loadImage("REINTENTAR.png");
  imageMode(CENTER);
  image(derrota, width / 2, height / 2); // Muestra la imagen de derrota
  image(reintentar, width / 2, 400, 600, 50); // Muestra el botón de reintentar
}

public void iniciarJuego() {
  player.play(); // Reproduce la música en el juego
  escenario.dibujar(); 
  if (frameCount % 30 == 0) { // Genera un nuevo objeto cada segundo (suponiendo 30 FPS)
    escenario.agregarObjetos();
  }
  escenario.manejadorObjetos.moverObjetos(); // Mueve los objetos en el escenario
  escenario.manejadorObjetos.verificarColisiones(escenario.personaje); // Verifica colisiones
  
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

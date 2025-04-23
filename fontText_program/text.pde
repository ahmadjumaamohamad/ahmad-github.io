

PFont appFont;
float fontSize;
float segoeScriptBoldAspectRAtio;
String title = "Wahoo!";
String footer = "varoom! varoom!";

void textSetup1() {
  println("start of console");

  String[] fontList = PFont.list();
  printArray(fontList);
  appFont = createFont("Segoe Script Bold", shorterSide);
}
void textSetup2() {
  
  
  for (int i = 0;i < rectDIVHeight.length; i++ ) {
    if (fontSize > rectDIVHeight[i] ) fontSize = rectDIVHeight[i];
  }
  
  segoeScriptBoldAspectRAtio = fontSize / smallestDIVrectHeight;
  fontSize = fontSize * segoeScriptBoldAspectRAtio;
}
void textDraw() {
}

class PixelGrid {
  Pixel[][] pixelList;
  PImage generated;
  CellularAutomata brightnessRules;
  
  PixelGrid() {
    pixelList = new Pixel[height][width];
    generated = new PImage();
    brightnessRules = new CellularAutomata();
  }
  
  void addPixel(int x, int y, color c) {
    pixelList[y][x] = new Pixel(c);
  }
  
  void generateRows() {
    for (int y = 1; y < height; y++) {
      for (int x = 0; x < width; x++) {
        pixelList[y][x] = new Pixel(pixelList[y-1][x].colour);
        color current = pixelList[y][x].colour;
        float hue = constrain(hue(current), 0, 100);
        float saturation = constrain(saturation(current), 0, 100);
        float brightness = brightness(current);
        if (x > 1 && x < width - 1) {
          float originalBrightness = brightness(pixelList[y - 1][x - 1].colour);
          float lBrightness = brightness(pixelList[y - 1][x - 1].colour);
          float rBrightness = brightness(pixelList[y - 1][x + 1].colour);
          int left = 0;
          if (lBrightness > 26) {
            left = 1;
          }
          int middle = 0;
          if (brightness > 26) {
            middle = 1;
          }
          int right = 0;
          if (rBrightness > 26) {
            right = 1;
          }
          int bit = brightnessRules.getBitValue(left, middle, right);
          if (bit == 0) {
            brightness -= (15 + originalBrightness / 20);
          } else {
            brightness += (19 + originalBrightness / 20);
          }
        }
        brightness = constrain(brightness, 0, 100);
        saturation = 0;
        pixelList[y][x].colour = color(hue, saturation, brightness);
      }
    }
  }
  
  void display() {
    generated = createImage(width, height, RGB);
    for (int i = 0; i < generated.pixels.length; i++) {
      int x = i % width;
      int y = floor(i / width);
      generated.pixels[i] = pixelList[y][x].colour; 
    }
    generated.updatePixels();
    image(generated, 0, 0);
  }
}

PixelGrid pixelGrid;
PImage row;
CurrentDate currentDate = new CurrentDate();

void setup() {
  size(1100, 1100);
  colorMode(HSB, 100);
  pixelGrid = new PixelGrid();
  getFirstRow();
  pixelGrid.generateRows();
  pixelGrid.display();
  save("output/1d-"+currentDate.toString()+".jpg");
}

void draw() {
  
}

void getFirstRow() {
  row = loadImage("media/gedling-single-row-2.jpg");
  image(row, 0, 0);
  for (int x = 0; x < width; x++) {
    pixelGrid.addPixel(x, 0, get(x, 0));
  }
}

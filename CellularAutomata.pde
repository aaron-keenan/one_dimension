class CellularAutomata {
 int getBitValue(int left, int middle, int right) {
    String threeBits = str(left) + str(middle) + str(right);
    int bit = 0;
    if (threeBits.equals("000")) bit = 1;
    if (threeBits.equals("001")) bit = 1;
    if (threeBits.equals("010")) bit = 0;
    if (threeBits.equals("011")) bit = 1;
    if (threeBits.equals("100")) bit = 0;
    if (threeBits.equals("101")) bit = 1;
    if (threeBits.equals("110")) bit = 0;
    if (threeBits.equals("111")) bit = 0;
    return bit;
  } 
}

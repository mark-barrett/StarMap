class Star
{
  int hab;
  String starName;
  float distance;
  float xg, yg, zg;
  float absMag;
  
  Star(int hab, String starName, float distance, float xg, float yg, float zg, float absMag)
  {
    this.hab = hab;
    this.starName = starName;
    this.distance = distance;
    this.xg = xg;
    this.yg = yg;
    this.zg = zg;
    this.absMag = absMag;
  }
  
  //To string method
  String toString()
  {
    return hab + "\t" + starName + "\t" + distance + "\t" + xg + "\t" + yg + "\t" + zg + "\t" + absMag;
  }
  
  //Draw star method
  void drawStar()
  {
    float mappedxg = map(this.xg, -5, 5, 50, width-50);
    float mappedyg = this.yg = map(this.yg, -5, 5, 50, height-50);
    stroke(250, 255, 3);
    line(mappedxg-6,mappedyg,mappedxg+6,mappedyg);
    line(mappedxg,mappedyg-6,mappedxg,mappedyg+6);
    stroke(255, 0, 0);
    ellipse(mappedxg, mappedyg, 12, 12);
    fill(255);
    textSize(10);
    textAlign(LEFT, CENTER);
    text(this.starName, mappedxg+10, mappedyg);
    noFill();
  }
  
}
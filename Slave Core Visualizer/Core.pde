class Core
{
  int coreX;
  int coreY;
  int coreSize;
  int startTime;
  int name;
  Color c;
  Core(Color coreColor, int n)
  {
   coreX = width/2;
   coreY = height/2;
   coreSize = 50;
   c = coreColor;
   name = n;
   startTime = millis();
  }
  
  
  void display()
  {
    coreSize = int(350*amp.analyze());
    fill(c.getRed(),c.getGreen(),c.getBlue());
    ellipse(this.coreX, this.coreY, coreSize, coreSize);
  }
  
  
  void move(Slave s)
  {
    int distY = Math.abs(coreY - s.slaveY);
    int distX = Math.abs(coreX - s.slaveX);
    int speedX = Math.round(distX/50);
    int speedY = Math.round(distY/50);
    
    if(millis() - startTime > 750)
      {
      }
    
    if(clicked == true)
    {
      coreX = mouseX;
      coreY = mouseY;
    }
    else
    {  
      if(coreX < s.slaveX)
        coreX = coreX + 1 * speedX;
      if(coreX > s.slaveX)
        coreX = coreX - 1 * speedX;
      if(coreY < s.slaveY)
        coreY = coreY + 1 * speedY;
      if(coreY > s.slaveY)
        coreY = coreY - 1 * speedY;
    }
      
  }
  
}
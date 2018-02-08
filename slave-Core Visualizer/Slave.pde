
class Slave
{
 
  int slaveX;
  int slaveY;
  int slaveSize;
  int startX;
  int startY;
  int moveAttempts;
  Color c;
  
  
  Slave(int x, int y)
  {
    this.slaveX = x;
    this.startX = x;
    this.slaveY = y;
    this.startY = y;
    this.slaveSize = 10;
    moveAttempts = 0;
    c = new Color(78,194,243);
  }
  
  
  
  void display()
  {
    if(slaveX == startX && slaveY == startY)
      c = new Color(78,194,243);
   fill(c.getRed(), c.getGreen(), c.getBlue());
   
     
   ellipse(slaveX, slaveY, slaveSize, slaveSize);
  }
  
  void move(Core core)
  {
    int distY = Math.abs(core.coreY - slaveY);
    int distX = Math.abs(core.coreX - slaveX);
    int speedX = Math.round(distX/10);
    int speedY = Math.round(distY/10);
      
    
    if(dist(slaveX,slaveY,core.coreX, core.coreY)< core.coreSize)
    {
        slaveSize = int(15*amp.analyze());
        if((c.equals(new Color(0, 100,50)) && core.name == 1) || (c.equals(new Color(255, 102,102)) && core.name == 2))
          c = new Color(255, 0, 255);
          //c = new Color(Math.round(random(0,255)), Math.round(random(0,255)), Math.round(random(0,255)));
        else if(core.name == 1)
          c = new Color(255, 102,102);
          //c = new Color(Math.round(random(0,255)), Math.round(random(0,255)), Math.round(random(0,255)));
        else if(core.name == 2)
         c = new Color(0, 100,50);
         //c = new Color(Math.round(random(0,255)), Math.round(random(0,255)), Math.round(random(0,255)));
        else if(core.name == 3)
          c = new Color(0, 50,50);
          //c = new Color(Math.round(random(0,255)), Math.round(random(0,255)), Math.round(random(0,255)));
          
        
        
        if(slaveX < core.coreX)
          slaveX = slaveX - 1 * speedX;
        if(slaveX > core.coreX)
          slaveX = slaveX + 1 * speedX;
          
        if(slaveY < core.coreY)
          slaveY = slaveY - 1 * speedY;
        if(slaveY > core.coreY)
          slaveY = slaveY + 1 * speedY;
        
    }
    else{
      if(clicked == false)
      {
        slaveSize = 10;
        if(slaveX < startX)
          slaveX = slaveX + 1;
        if(slaveX > startX)
          slaveX = slaveX - 1;
          
        if(slaveY < startY)
          slaveY = slaveY + 1;
        if(slaveY > startY)
          slaveY = slaveY - 1;
      }
    }
         
  }
  
 
  void teleport()
  {
   slaveX = int(random(width));
   slaveY = int(random(height));
  }
}
import processing.sound.*;
import java.awt.Color;

Slave[][] slaves = new Slave[49][27];
ArrayList<Core> cores = new ArrayList<Core>();
ArrayList<Slave> goToSlaves = new ArrayList<Slave>();
int timeStart = millis();
Amplitude amp;
SoundFile file;
Core core;
Core core2;

boolean coreMove = false;
boolean clicked = false;
Slave goToSlave = null;
Slave goToSlave2 = null;
int posY = 40;
int posX = 40;

void setup()
{
  size(1920,1080);
  amp = new Amplitude(this);
  file = new SoundFile(this, "aero.mp3");
  file.play();
  amp.input(file);
  cores.add(new Core(new Color(216,243,78), 1));
  cores.add(new Core(new Color(255,102,255), 2));
  for(int i = 0; i < slaves.length; i++)
  {
    for(int j = 0; j < slaves[0].length; j++)
    {
         slaves[i][j] = new Slave(posX, posY);
        posY = posY+40;
    }
    posX = posX + 40;
    posY = 0;
  }
  goToSlaves.add(slaves[Math.round(random(1,slaves.length)-1)][Math.round(random(1,slaves[0].length))-1]);
  goToSlaves.add(slaves[Math.round(random(1,slaves.length)-1)][Math.round(random(1,slaves[0].length))-1]);
  //goToSlaves.add(slaves[Math.round(random(1,slaves.length)-1)][Math.round(random(1,slaves[0].length))-1]);
}


void draw()
{
  background(50);
  int index = 0;
  for(Core c : cores)
  {
    c.display();
    if(millis() - timeStart > 500)
      {
        println(millis() - timeStart);
        for(int i = 0; i<goToSlaves.size(); i++)
        {
           goToSlaves.set(index, slaves[Math.round(random(1,slaves.length)-1)][Math.round(random(1,slaves[0].length))-1]);
           timeStart = millis();
        }
      }
    
    c.move(goToSlaves.get(index));
    index++;
   for(int i = 0; i < slaves.length; i++)
    {
      for(int j = 0; j < slaves[0].length; j++)
      {
         slaves[i][j].display(); 
         slaves[i][j].move(c);
        // slaves[i][j].move(core2);
      }
    }
  }
}


void mouseClicked()
{
  if(clicked == false)
    clicked = true;
  else if(clicked == true)
    clicked = false;
}

void keyPressed()
{
 if(key == 'w')
   {
     file.stop();
     file = new SoundFile(this, "sail.mp3");
     file.play();
     amp.input(file);
   }
   if(key == 's')
   {
     file.stop();
     file = new SoundFile(this, "sia.mp3");
     file.play();
     amp.input(file);
   }
   if(key == 'a')
   {
     file.stop();
     file = new SoundFile(this, "aero.mp3");
     file.play();
     amp.input(file);
   }
   if(key == 'l')
   {
     file.stop();
     file = new SoundFile(this, "Lucio.mp3");
     file.play();
     amp.input(file);
   }
   if(key == 'o')
   {
     file.stop();
     file = new SoundFile(this, "aron.mp3");
     file.play();
     amp.input(file);
   }
   if(key == 'd')
   {
     file.stop();
     file = new SoundFile(this, "drum.mp3");
     file.play();
     amp.input(file);
   } 
}
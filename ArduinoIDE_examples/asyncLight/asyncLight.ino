int aRedPin = 8;
int aYellowPin = 9;
int aGreenPin = 10;
int bRedPin = 11;
int bYellowPin = 12;
int bGreenPin = 13;
int state = 0;
int stateTimes[] = {500, 2000, 10000, 2000, 500, 2000, 10000, 2000};
long nextChange;

void setup()
{
  pinMode(aRedPin, OUTPUT);
  pinMode(aYellowPin, OUTPUT);
  pinMode(aGreenPin, OUTPUT);
  pinMode(bRedPin, OUTPUT);
  pinMode(bYellowPin, OUTPUT);
  pinMode(bGreenPin, OUTPUT);
  state0();
  nextChange = millis() + stateTimes[0];
}

void loop()
{
  long curTime = millis();
  updateLight(curTime);
  // Update other modules...
}

void updateLight(long t)
{
  if(t < nextChange) return;
  ++state;
  if(state > 7) state = 0;
  nextChange += stateTimes[state];
  switch(state)
  {
    case 0:
      state0();
      break;
    case 1:
      state1();
      break;
    case 2:
      state2();
      break;
    case 3:
      state3();
      break;
    case 4:
      state4();
      break;
    case 5:
      state5();
      break;
    case 6:
      state6();
      break;
    case 7:
      state7();
      break;
  }
}

//State 0
//A red, B red
void state0()
{
  digitalWrite(aRedPin, HIGH);
  digitalWrite(aYellowPin, LOW);
  digitalWrite(aGreenPin, LOW);
  digitalWrite(bRedPin, HIGH);
  digitalWrite(bYellowPin, LOW);
  digitalWrite(bGreenPin, LOW);
}

//State 1
// A red + yellow, B red
void state1()
{
  digitalWrite(aRedPin, HIGH);
  digitalWrite(aYellowPin, HIGH);
  digitalWrite(aGreenPin, LOW);
  digitalWrite(bRedPin, HIGH);
  digitalWrite(bYellowPin, LOW);
  digitalWrite(bGreenPin, LOW);
}

//State 2
// A green, B red
void state2()
{
  digitalWrite(aRedPin, LOW);
  digitalWrite(aYellowPin, LOW);
  digitalWrite(aGreenPin, HIGH);
  digitalWrite(bRedPin, HIGH);
  digitalWrite(bYellowPin, LOW);
  digitalWrite(bGreenPin, LOW);
}

//State 3
// A yellow, B red
void state3()
{
  digitalWrite(aRedPin, LOW);
  digitalWrite(aYellowPin, HIGH);
  digitalWrite(aGreenPin, LOW);
  digitalWrite(bRedPin, HIGH);
  digitalWrite(bYellowPin, LOW);
  digitalWrite(bGreenPin, LOW);
}

//State 4
// A red, B red
void state4()
{
  digitalWrite(aRedPin, HIGH);
  digitalWrite(aYellowPin, LOW);
  digitalWrite(aGreenPin, LOW);
  digitalWrite(bRedPin, HIGH);
  digitalWrite(bYellowPin, LOW);
  digitalWrite(bGreenPin, LOW);
}

//State 5
// A red, B red + yellow
void state5()
{
  digitalWrite(aRedPin, HIGH);
  digitalWrite(aYellowPin, LOW);
  digitalWrite(aGreenPin, LOW);
  digitalWrite(bRedPin, HIGH);
  digitalWrite(bYellowPin, HIGH);
  digitalWrite(bGreenPin, LOW);
}

//State 6
// A red, B green
void state6()
{
  digitalWrite(aRedPin, HIGH);
  digitalWrite(aYellowPin, LOW);
  digitalWrite(aGreenPin, LOW);
  digitalWrite(bRedPin, LOW);
  digitalWrite(bYellowPin, LOW);
  digitalWrite(bGreenPin, HIGH);
}

//State 7
// A red, B yellow
void state7()
{
  digitalWrite(aRedPin, HIGH);
  digitalWrite(aYellowPin, LOW);
  digitalWrite(aGreenPin, LOW);
  digitalWrite(bRedPin, LOW);
  digitalWrite(bYellowPin, HIGH);
  digitalWrite(bGreenPin, LOW);
}

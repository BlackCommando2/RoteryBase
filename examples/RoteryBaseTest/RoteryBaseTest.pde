#include <EspNow.h>
Peer baserr;
Peer feed;
#include <RoteryBase.h>
RoteryBase r1;
Direction remoteData;
JSONVar feedeer;
UniversalEncoder EncY(25, 33, -1), EncX(5, 18, 1), EncR(0, 0, 1);// for normal direction
Motor m1(13, 12, 0), m2(27, 26, 0), m3(16, 4, 0), m4( 0, 0, 0);
//UniversalEncoder EncY(4, 18, -1), EncX(32, 33, 1), EncR(14, 27, -1);// for normal direction
//Motor m1(23, 19 , 0), m3(26, 25, 0), m4(0, 0, 0), m2( 13, 12, 0);

String userInMsg;

void setup()
{
  Serial.begin(115200);

  r1.setMotors(&m1, &m2, &m3, &m4);
  //  r1.enableAutoMode(); //new
  r1.setEncoders(&EncX, &EncY, &EncR);
  r1.setup();

  setId("WardL");
  baserr.init("TenZZ");
//  feed.init("BeEeR");

//  m1.invertDirection();
//  m3.invertDirection();
//  m2.invertDirection();
  baserr.setOnRecieve(setbaseDirection, "ERDR");
  //  baserr.setOnRecieve(setAutoMode, "aMode");
  //  feed.setOnRecieve(setbaseDirection, "drive");
}

void loop() {
//  Serial.println(String(EncX.getReadings()) + ", " + String(EncY.getReadings()) + ", " + String(EncR.getReadings()));
  if (Serial.available() > 0)
  {
    r1.getUserInRef()->input();
    //    r1.getPulseUserInRef()->input();
    //userIn.input();
  }

  r1.compute();
}

void setbaseDirection(JSONVar msg)
{
  r1.getUserInRef()->parseJson(msg);
  //  if (r1.autoMode)
  //  {
  //    r1.getPulseUserInRef()->parseJson(msg);
  //  }
  //  else if (!r1.autoMode)
  //  {
  //    r1.getUserInRef()->parseJson(msg);
  //  }
  //  userInMsg = JSON.stringify(msg);
  //  Serial.println(userInMsg);
}
//
//void setAutoMode(JSONVar msg)
//{
//  r1.enableAutoMode((bool)msg["mode"]);
//}
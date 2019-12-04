//fix the sketch so that it correctly uses the myFunc 
//function to print the anotherStr String declared in setup().

String str = "I am a string!";
String anotherStr = "I want to use the myFunc function to print this String!";
void setup() {
  println(str);
  myFunc();
}
void myFunc() {
  println(anotherStr);
}

//Fix the functions so that the addNumbers function
//returns the sum of two random integers and the 
//returnAString function combines two strings.

int n1, n2; 
int sum; 
String additionSentence; 
String result;
String s1, s2, s3;

void setup() {
  size(500, 300); 
  background(0);

  n1 = int(random(0, 10)); 
  n2 = int(random(0, 10)); 

  sum =  addNumbers(n1,n2);

  additionSentence = str(n1) + " + " + str(n2) + " = " + str(sum); 
  text(additionSentence, width*.2, height/2); 
  
  s1 = "Plus 2 random numbers from 1 to 10, ";
  s2 = "n1 = " + n1 + ", ";
  s3 = "n2 = " + n2;

  //display text from the return a string function
  result = returnAString(s1, s2, s3);
  text(result, width/5, height/3);
}


int addNumbers(int num1, int num2) {
  //addition sentence here
  int sumLocal;
  sumLocal = num1 + num2;
  return sumLocal;
}

//fix the function errors here
String returnAString(String string1, String string2, String string3) {
  String combinedString = string1 + string2 + string3;
  return combinedString;
} 

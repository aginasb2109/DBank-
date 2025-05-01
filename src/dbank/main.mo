import Debug "mo:base/Debug";
import Time "mo:base/Time";
import Float "mo:base/Float";

actor Dbank{
  stable var currentValue: Float =100;
  currentValue:=200;

  stable var startTime =Time.now();
  startTime:=Time.now();
 Debug.print(debug_show(startTime));

  
public func topUp(amt:Float){
  currentValue+=amt;
  Debug.print(debug_show(currentValue));
};


public func withdraw(amt:Float){
  let tempValue:Float =currentValue-amt;
  if(tempValue>=0){
    currentValue-=amt;
  Debug.print(debug_show(currentValue));
  }
  else{
    Debug.print("Subtracting results in negative number");
  };
};

 public query func checkBalance():async Float{
  return currentValue;
  
 };

 public func compound(){
  let currentTime=Time.now();
  let timeLapsedNs=currentTime-startTime;
  let timeLapseds=timeLapsedNs/1000000000;
  currentValue := currentValue*(1.01 ** Float.fromInt(timeLapseds));
  startTime:=currentTime;

 };





}


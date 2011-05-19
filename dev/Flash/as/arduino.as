//import firmata libraries//
import net.eriksjodin.arduino.Arduino;
import net.eriksjodin.arduino.ArduinoWithServo;
import net.eriksjodin.arduino.events.ArduinoEvent;
import net.eriksjodin.arduino.events.ArduinoSysExEvent;


// store a digitalValue for edge/state change detection. 
var lastDigitalValue:Boolean; 
var lastDigitalValue2:Boolean;
var lastDigitalValue3:Boolean;

// make a timer object that calls the timerEvent function 20 times a second (every 50ms)
var refreshTimer = new Timer(50);

refreshTimer.addEventListener(TimerEvent.TIMER, onTick);

// Change this array to the pin configuration you use in your own setup.
var defaultPinConfig:Array = new Array(
	null,		// Pin 0   null (is RX)
	null,		// Pin 1   null (is TX)
	'digitalIn',  // Pin 2   digitalIn or digitalOut 
	'digitalIn',  // Pin 3   pwmOut or digitalIn or digitalOut 
	'digitalIn',  // Pin 4   digitalIn or digitalOut  
	'digitalIn',  // Pin 5   pwmOut or digitalIn or digitalOut 
	'digitalIn'  // Pin 6   pwmOut or digitalIn or digitalOut 
	
);


// Arduino object
var a:ArduinoWithServo;

// connect to a serial proxy on port 5331
a = new ArduinoWithServo("127.0.0.1", 5331);

// listen for connection 
a.addEventListener(Event.CONNECT,onSocketConnect); 
a.addEventListener(IOErrorEvent.IO_ERROR,errorHandler);
			
// listen for firmware (sent on startup)
a.addEventListener(ArduinoEvent.FIRMWARE_VERSION, onReceiveFirmwareVersion);

// == SETUP AND INITIALIZE CONNECTION ( don't modify ) ==================================

// triggered when there is an IO Error
function errorHandler(errorEvent:IOErrorEvent):void 
{   trace("- "+errorEvent.text);
    trace("- Did you start the Serproxy program ?");
}

// triggered when a serial socket connection has been established
function onSocketConnect(e:Object):void 
{	trace("- Connection with Serproxy established. Wait one moment.");
	
	// request the firmware version
	a.requestFirmwareVersion();	
}

function onReceiveFirmwareVersion(e:ArduinoEvent):void 
{   trace("- Connection with Arduino - Firmata version: " + String(e.value)); 		
	trace("- Set default pin configuration.");

	// set Pinmodes by the default array. 
	for(var i:int = 2; i<defaultPinConfig.length; i++)
	{ 
  	  // set digital input pins
	  if(defaultPinConfig[i] == "digitalIn")  a.setPinMode(i, Arduino.INPUT);
     
	}	
	
	// for digital pins its only one setting
	a.enableDigitalPinReporting();	
	
	startProgram();	
}

// == START PROGRAM =====================================================================

function startProgram()
{	trace("- Start program.");

	// start the timer that calls the onTick function
    refreshTimer.start();	
}


function onTick(event:TimerEvent):void 
{	

//button 1//

	var digitalValue:Boolean;
	digitalValue = a.getDigitalData(2);
	
	if (digitalValue != lastDigitalValue) {
		
		// button pressed?
		if(digitalValue == true) {
			officeAction();		//main.as
		}
		
		lastDigitalValue = digitalValue;
	}
	
//button 2//

	var digitalValue2:Boolean;
	digitalValue2 = a.getDigitalData(3);
	
	
	if (digitalValue2 != lastDigitalValue2) {
		
		// button pressed?
		if(digitalValue2 == true) {
			shopAction();		//main.as
		}
		
		// store the current digitalValue in lastDigitalValue for the 
		// next check (following call of the onTick function).
		lastDigitalValue2 = digitalValue2;
	}
	
	
	//reset button//

	var digitalValue3:Boolean;
	digitalValue3 = a.getDigitalData(4);
	
	
	if (digitalValue3 != lastDigitalValue3) {
		
		// button pressed?
		if(digitalValue3 == true) {
			
			resetCounters();
			
			
		}
		
		// store the current digitalValue in lastDigitalValue for the 
		// next check (following call of the onTick function).
		lastDigitalValue3 = digitalValue3;
	}	
}

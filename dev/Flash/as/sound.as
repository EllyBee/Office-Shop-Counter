﻿//////////////soundimport flash.media.SoundMixer;import flash.media.Sound;var officeSoundNumber:Number = 0;var shopSoundNumber:Number = 0;var clickSound:Sound = new Sound();var i;var shopSounds:Array = new Array(7);for(i=0; i<7; i++) shopSounds[i] = new Sound();var officeSounds:Array = new Array(7);for(i=0; i<7; i++) officeSounds[i] = new Sound();function loadSounds():void{	clickSound.load(new URLRequest("snd.mp3"));	loadOfficeSounds();	loadShopSounds();}function loadOfficeSounds():void{	officeSounds[0].load(new URLRequest("sounds/office/typing.mp3"));	officeSounds[1].load(new URLRequest("sounds/office/call-extension-number.mp3"));	officeSounds[2].load(new URLRequest("sounds/office/winxp.mp3"));	officeSounds[3].load(new URLRequest("sounds/office/fax-machine.mp3"));	officeSounds[4].load(new URLRequest("sounds/office/office-sounds.mp3"));	officeSounds[5].load(new URLRequest("sounds/office/office-phone-answer.mp3"));	officeSounds[6].load(new URLRequest("sounds/office/reception-legal-department.mp3"));}function loadShopSounds():void{	shopSounds[0].load(new URLRequest("sounds/shop/cash_register.mp3"));	shopSounds[1].load(new URLRequest("sounds/shop/clean-up-aisle-6.mp3"));	shopSounds[2].load(new URLRequest("sounds/shop/chime.mp3"));	shopSounds[3].load(new URLRequest("sounds/shop/store-closing-shortly-pa.mp3"));	shopSounds[4].load(new URLRequest("sounds/shop/comeagain.mp3"));	shopSounds[5].load(new URLRequest("sounds/shop/cash_register2.mp3"));	shopSounds[6].load(new URLRequest("sounds/shop/buzzer.mp3"));}function playRandomSounds(which:String):void {	SoundMixer.stopAll();	var rdm:Number;	if(which == 'shop'){				shopSounds[shopSoundNumber].play();				shopSoundNumber ++;				if(shopSoundNumber > 6){									shopSoundNumber = 0;		}				}	if(which == 'office'){				officeSounds[officeSoundNumber].play();						officeSoundNumber ++;				if(officeSoundNumber > 6){									officeSoundNumber = 0;		}	}}
//////////////sound
import flash.media.SoundMixer;

var clickSound:Sound = new Sound();

var i;
var shopSounds:Array = new Array(5);
for(i=0; i<5; i++) shopSounds[i] = new Sound();

var officeSounds:Array = new Array(5);
for(i=0; i<5; i++) officeSounds[i] = new Sound();


function loadSounds():void{
	clickSound.load(new URLRequest("snd.mp3"));
	loadOfficeSounds();
	loadShopSounds();
}

function loadOfficeSounds():void{
	officeSounds[0].load(new URLRequest("sounds/office/hello.mp3"));
	officeSounds[1].load(new URLRequest("sounds/office/yeah.mp3"));
	officeSounds[2].load(new URLRequest("sounds/office/applause.mp3"));
	officeSounds[3].load(new URLRequest("sounds/office/winxp.mp3"));
	officeSounds[4].load(new URLRequest("sounds/office/Nokia tune.mp3"));
}

function loadShopSounds():void{
	shopSounds[0].load(new URLRequest("sounds/shop/door_bell.mp3"));
	shopSounds[1].load(new URLRequest("sounds/shop/pingpong.mp3"));
	shopSounds[2].load(new URLRequest("sounds/shop/chime.mp3"));
	shopSounds[3].load(new URLRequest("sounds/shop/door_bell_two.mp3"));
	shopSounds[4].load(new URLRequest("sounds/shop/booing.mp3"));
}



function playRandomSounds(which:String):void {
	SoundMixer.stopAll();
	var rdm:Number;
	if(which == 'shop'){
		rdm = Math.floor(Math.random()*shopSounds.length);
		shopSounds[rdm].play();
	}
	if(which == 'office'){
		rdm = Math.floor(Math.random()*officeSounds.length);
		officeSounds[rdm].play();
	}
}


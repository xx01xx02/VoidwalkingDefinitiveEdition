function onCreate()
   
    canPress = false;
	Presses = 0;
    PressNeeded = 1;
	
    precacheImage('stonebar');
	precacheSound('gotstoned');
end

function onEvent(name, value1, value2)
    if name == "Stoned" then
    --Get Dodge time
    PressNeeded = value1;
	Presses = 0;
	playSound('stonetransform', 0.9);
	triggerEvent('Change Character', 'BF', 'stonebf');
	
    --Make Dodge Sprite
	makeAnimatedLuaSprite('stonebar', 'stonebar', 400, 200);
    luaSpriteAddAnimationByPrefix('stonebar', 'stonebar', 'stonebar', 25, true);
	luaSpritePlayAnimation('stonebar', 'stonebar');
	setObjectCamera('stonebar', 'other');
	scaleLuaSprite('stonebar', 0.50, 0.50); 
    addLuaSprite('stonebar', true); 
	
	--Set values so you can dodge
	canPress = true;

	
	end
end

function onUpdate()
   if canPress == true and keyJustPressed('space') then
		if Presses < PressNeeded - 1 then
			playSound('gotstoned', 0.9);
			Presses = Presses + 1;
		else
			triggerEvent('Change Character', 'BF', 'petrolbf');
			playSound('stonefree', 0.9);
			removeLuaSprite('stonebar');
			canPress = false;
		end
   end
end

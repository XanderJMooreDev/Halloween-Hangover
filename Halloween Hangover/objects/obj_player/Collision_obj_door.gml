// Runs code if we have a key. 
if hasKey{
	if room == room_combat_test{
		room_goto(Level1);
	}
	if room == Level1{
		room_goto(Level2);
	}
}
else{}
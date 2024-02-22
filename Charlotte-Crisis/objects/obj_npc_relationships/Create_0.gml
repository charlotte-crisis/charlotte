/// @description Track NPC relationships
//  as NPC objects are not persistent

npc_relationships = {
	"A":  50, // Anthony
	"CJ": 50, // Chenjie
	"V":  50, // Vera
	"J":  50, // Joanna
	"N":  50, // Nadia
	"S":  50, // Sage
}

#region Functions

function change_relationship(_name, _amount) {
	var _total = npc_relationships[$ _name] + real(_amount);
	
	// Ensure doesn't go past 0 or 100.
	if (_total > 100) {
		_total = 100;
	} else if (_total < 0) {
		_total = 0;	
	}
	npc_relationships[$ _name] = _total;	
	return _total;
}

function get_relationship(_name) {
	return npc_relationships[$ _name];	
}
#endregion















/// @description Track NPC relationships
//  as NPC objects are not persistent
if instance_number(object_index) > 1 {
    instance_destroy();
    exit;
}

npc_relationships = {
	"A":  50, // Anthony
	"CJ": 50, // Chenjie
	"V":  50, // Vera
	"J":  50, // Joanna
	"N":  50, // Nadia
	"S":  50, // Sage
	"Si": 50, // Sister
	"M":  50, // Mother
	"H":  50, // Helen
}

npc_knows = {
	"A":  false, // Anthony
	"CJ": false, // Chenjie
	"V":  false, // Vera
	"J":  false, // Joanna
	"N":  false, // Nadia
	"S":  false, //Sage
	"Si": true,  // Sister
	"M":  true, // Mother
	"H":  true, // Helen
}

#region Setters and Getters

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

	get_relationship = function(_name) {
		return npc_relationships[$ _name];	
	}
	
	// returns threshold
	// 0 if bad
	// 1 if Neutral
	// 2 if Good
	get_relationship_level = function(_name) {
		var _rs = npc_relationships[$ _name];
		if (_rs >= 70) {
			return 2;	
		} else if (_rs > 30) {
			return 1;	
		} else {
			return 0;	
		}
	}

	/// @description the NPC's value will be set to "true"
	/// to indicate they know about charlotte
	/// @param {String} _name Name, initial e.g. "V"
	function set_npc_knows(_name) {
		 npc_knows[$ _name] = true;
	}

	/// @description Returns true if npc knows about Charlotte
	/// @param {String} _name Name, initial e.g. "V"
	function get_npc_knows(_name) {
		return npc_knows[$ _name];
	}

#endregion

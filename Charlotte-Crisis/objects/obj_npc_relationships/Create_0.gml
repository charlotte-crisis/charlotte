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

npc_knows = {
	"A":  false, // Anthony
	"CJ": false, // Chenjie
	"V":  false, // Vera
	"J":  false, // Joanna
	"N":  false, // Nadia
	"S":  false, //Sage
}

// Relationships menu part
relationships_menu_open = false;
current_row = 0; // Max 0, 1
current_col = 0; // Max 0, 1, 2

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

	function get_relationship(_name) {
		return npc_relationships[$ _name];	
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















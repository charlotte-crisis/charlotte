/// @description Insert description here
// You can write your code in this editor
indicator = instance_create_layer(x,y,"Helpers", obj_indicator_up);
indicator.visible = false;

#region Relationship related stats and functions

// relationship meter from 0 to 100. Base at 50.
relationship = 50;

/// @function change_relationship(_parameters)
/// @description	 Adds amount of relationship. Limit at 0 or 100.
/// @param {Real} _amount
/// @return {Real}
function change_relationship(_amount) {
	var _total = relationship + real(_amount);
	
	// Ensure doesn't go past 0 or 100.
	if (_total > 100) {
		_total = 100;	
	} else if (_total < 0) {
		_total = 0;	
	}
	relationship = _total;	
	return _total;
}
#endregion

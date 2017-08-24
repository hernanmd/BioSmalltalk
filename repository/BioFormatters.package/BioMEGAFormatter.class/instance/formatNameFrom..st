private
formatNameFrom: nameString
	" Remove invalid MEGA characters from nameString "
	
	^ nameString copyReplaceAll: ' ' with: '_' 
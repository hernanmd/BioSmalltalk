accessing
description
	" Answer a <String> representing receiver description text "
	
	^ description
		ifNil: [ description := String new ]
private
checkInvariant

	^forwards size = backwards size and: [
		(forwards keys \ backwards values) isEmpty and: [ 
			(forwards values \ backwards keys) isEmpty ]]
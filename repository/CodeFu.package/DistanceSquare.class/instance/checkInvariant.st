private
checkInvariant

	^super checkInvariant and: [
		(distanceBlock respondsTo: #value:value:) and: [
			items isCollection ]]
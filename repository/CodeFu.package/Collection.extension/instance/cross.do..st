*codefu
cross: aCollection do: aBlock
	"Evaluates aBlock for each pair of the receiver's elements."

	self do: [ :each |
		aCollection do: [ :another | 
			aBlock value: each value: another ] ].
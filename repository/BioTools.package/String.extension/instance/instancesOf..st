*BioTools
instancesOf: aCharacter

	| count |
	count := 0.
	self do: [ :char | aCharacter = char ifTrue: [ count := count + 1. ]. ].
	^ count.
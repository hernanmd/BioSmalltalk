accessing
sizeExcludeTerminals
	"Answer how many symbols (bases or amino acids) contains the receiver, excluding stop/terminal letters (like $*) "
	
	| count |
	
	count := 0.
	seq do: [ : letter |
		letter == self stopSymbol
			ifFalse: [ count := count + 1 ] ].
	^ count
sections
dataSection
	" Private - Set and answer a new data section "
	
	( self includesSection: BioA31DataSection notation )
		ifFalse: [ dataSection := self newSectionNamed: BioA31DataSection ].
	^ dataSection
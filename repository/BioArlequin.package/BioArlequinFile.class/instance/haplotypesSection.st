sections
haplotypesSection
	" Private - Set and answer a new haplotypes section "
	
	^ haplotypesSection 
		ifNil: [ haplotypesSection := self newHaplotypesSection ].

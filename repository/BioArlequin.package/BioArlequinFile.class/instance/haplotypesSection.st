sections
haplotypesSection
	" Private - Set and answer a new haplotypes section "
	
	(self includesSection: BioA31HaplotypeSection notation)
		ifFalse: [ haplotypesSection := self newHaplotypesSection ].
	^ haplotypesSection
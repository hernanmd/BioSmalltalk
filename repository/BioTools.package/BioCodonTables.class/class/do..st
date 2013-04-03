enumerating
do: aBlock
	" Iterate and evaluate aBlock with each codon of the receiver's elements as the argument."
	
	self codonTables do: [ : each | aBlock value: each ]
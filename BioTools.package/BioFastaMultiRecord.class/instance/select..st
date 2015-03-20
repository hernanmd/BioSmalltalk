accessing
select: aBlock
	"Evaluate aBlock with each of the receiver's fasta records as the argument. 
	Collect into a new collection like the receiver, only those elements for 
	which aBlock evaluates to true. Answer the new collection."
	
	| newInstance |
	
	(newInstance := self class new) 
		sequences: (self sequences select: aBlock).
	^ newInstance
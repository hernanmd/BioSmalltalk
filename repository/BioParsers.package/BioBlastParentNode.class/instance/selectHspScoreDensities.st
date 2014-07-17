hsps accessing
selectHspScoreDensities
	" Private - Handle the case for multiple HSPs.
	If there are multiple HSPs, this will answer a Number with the one with the highest alignment. "
	
	| score |
	^ (score := self hspScoreDensity) size > 1
		ifFalse: [ 
			score isEmpty 
				ifTrue: [ 'Not present' ]
				ifFalse: [ score anyOne blastValue ] ]
		ifTrue: [ (score detectMax: [: hspScoreDensity | hspScoreDensity blastValue size ]) blastValue ]
comparing
<= aBioAffyProbetSetRecord

	self chr < aBioAffyProbetSetRecord chr
		ifTrue: [ ^ true ].
	self chr = aBioAffyProbetSetRecord chr
		ifTrue: [ ^ self position <= aBioAffyProbetSetRecord position ].
	self chr > aBioAffyProbetSetRecord chr
		ifTrue: [ ^ false ].
	self halt.
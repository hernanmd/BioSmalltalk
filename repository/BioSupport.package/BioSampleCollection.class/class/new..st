instance creation
new: nElements
	" Create a sample collection large enough to hold nElements without growing "
	
	| inst |
	inst := self new.
	inst samples: (inst samplesCollectionClass new: nElements).
	^ inst

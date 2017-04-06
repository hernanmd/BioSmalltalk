*BioWrappers
asPLINKParameter
	" Answer a <String> representation suitable to use as PLINK parameter "
	
	^ self size = 1
		ifTrue: [ self anyOne ]
		ifFalse: [ (self collect: #asPLINKParameter) joinUsing: ',' ].
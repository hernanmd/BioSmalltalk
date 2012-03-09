accessing public
useWebEnv
	" Search with the current parameters and answer 
	a new instance of the receiver's using previous web environment  "
	
	| webEnv newInstance |
	
	webEnv := self setUseHistory; search.
	newInstance := self class new.
	( newInstance perform: self url dbName asSymbol ) client: newInstance.
	[ newInstance webEnv: webEnv ]
	on: BioErrorSpecificationObject
	do: [ : ex | ^ self lastStatus: ex messageText ].
	^ self becomeForward: newInstance

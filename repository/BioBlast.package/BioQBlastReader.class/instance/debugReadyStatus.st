accessing-get
debugReadyStatus
	" Private - Log debug status information "
	
	( self gtDebug and: [ self results isNil not ] )
		ifTrue: [
			self gtLog: ( self results first: 20 ).
			self gtLog: 'Status ' , self status.
			self outputToFile: 'parcial' , UUID new asString36 , '.html'  contents: self results ].
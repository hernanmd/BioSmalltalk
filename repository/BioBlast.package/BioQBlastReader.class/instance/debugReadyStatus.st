accessing-get
debugReadyStatus
	" Private - Log debug status information "
	
	(self gtDebug and: [ self results isNil not ])
		ifTrue: [
			self bioLog: (self results first: 20).
			self bioLog: 'Status ' , self status.
			self 
				dumpToFileNamed: 'parcial' , BioNamedObject uniqueName , '.html'  
				contents: self results ].
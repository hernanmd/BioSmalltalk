accessing public - commands
setPutCommand
	" Set the receiver's command to GET "
	
	cmd isNil
		ifTrue: [ cmd := BioNCBIPut new client: self ]
		ifFalse: [ cmd isPut  
					ifFalse: [ cmd := BioNCBIPut new client: self ] ].
	" The PUT command should only be set once "
	( self putUrl includesParameter: BioNCBICommand cmdString )
		ifFalse: [ self putUrl startParameters: cmd baseUrl ].				
		
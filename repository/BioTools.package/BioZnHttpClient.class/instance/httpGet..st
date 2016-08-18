accessing
httpGet: urlString
	"Get the response from the given url"
	" (self httpGet: 'http://www.squeak.org') content "
	
	^ [ (self classFor: self providerClass) new get: urlString ]
		on: ZnEntityTooLarge, ConnectionClosed 
		do: [ : ex | 
			ex isResumable 
				ifTrue: [ ex resume ]
				ifFalse: [ self handleNonResumableConnection: ex ] ].
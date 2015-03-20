accessing
defaultProviderClass
	" Private - Answer the preferred provider subclass "
	
	^ self hasAnyProvider
		ifTrue: [ 
			| adapterClass |
			adapterClass := self allFinalClasses detect: #isPreferredAdapter.
			self classFor: adapterClass providerClass ]
		ifFalse: [ self signalInvalidObject: 'No provider was found' ] 
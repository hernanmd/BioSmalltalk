accessing
saveERecordValue: aString

	( self includesGeoInformation: aString )
		ifTrue: [ super saveERecordValue: aString ].
	( self includesRecordInformation: aString )
		ifTrue: [
			" Esto es porque el GBReference_title esta repetido y a veces incluye informacion valiosa de la region "
			( ( current = 'GBReference_title' ) and: [ ( self eRecord includesKey: 'GBReference_title' ) ] )
				ifTrue: [ self eRecord at: 'GBReference_title_plus' put: aString ]
				ifFalse: [ " Solo nos interesa el primer autor "
					( current = 'GBAuthor' and: [ self eRecord includesKey: 'GBAuthor' ] )
						ifFalse: [ super saveERecordValue: aString ] ] ]
accessing
groups
	" Answer a Collection of Arlequin groups "

	| groupSamples clusters |

	clusters := self classifications asOrderedCollection.
	groupSamples := clusters collect: [: classAssoc |
		classAssoc key -> ( classAssoc value collect: [: recordsByAlignment | 
			recordsByAlignment contents groupedBy: [: seqRecord | 
				seqRecord 
					at: self keyString 
					ifAbsent: [ 'Unqualified' ] ] ] ) ].

	^ groupSamples collect: [: group | 
		BioA31Group
			named: group key territoryName
			data: ( BioGBA31SampleParameters on: group value ) ].
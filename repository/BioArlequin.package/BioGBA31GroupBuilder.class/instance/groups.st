accessing
groups
	" Answer a Collection of Arlequin groups "

	| groupSamples clusters |

	" Remove empty groups as Arlequin does not parse well empty groups "
	clusters := (self classifications asOrderedCollection) reject: [ : assoc | assoc key classifications isEmpty ].
	groupSamples := clusters collect: [ : classAssoc |
		classAssoc key -> (classAssoc value collect: [ : recordsByAlignment | 
			recordsByAlignment contents groupedBy: [ : seqRecord | 
				seqRecord 
					at: self keyString 
					ifAbsent: [ 'Unqualified' ] ] ]) ].

	^ groupSamples collect: [ : group | 
		BioA31Group
			named: group key name
			data: (BioGBA31SampleParameters on: group value) ].
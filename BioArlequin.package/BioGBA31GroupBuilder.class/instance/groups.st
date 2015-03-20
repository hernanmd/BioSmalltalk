accessing
groups
	" Answer a Collection of Arlequin groups "

	| groupSamples |

	groupSamples := self classifications collect: [ : classAssoc |
		classAssoc key -> (classAssoc value collect: [ : recordsByAlignment | 
			recordsByAlignment contents groupedBy: [ : seqRecord | 
				seqRecord 
					at: self keyString 
					ifAbsent: [ 'Unqualified' ] ] ]) ].

	^ groupSamples collect: [ : group | 
		BioA31Group
			named: group key name
			data: (BioGBA31SampleParameters on: group value) ].
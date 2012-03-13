accessing
addPopulations
	" Private - Format samples for the receiver "

	| section |
	section := self dataSection.
	self populations do: [: pop |
		section	
			addSampleName: pop territory name;
			addSampleSize: pop samples size.
		pop samples do: [: smp |
			section buildSampleData: smp ].
		section addSampleData.
		].

	
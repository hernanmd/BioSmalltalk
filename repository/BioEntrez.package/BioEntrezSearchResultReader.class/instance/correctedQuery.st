accessing
correctedQuery
	" Answer a <String> with the corrected query spelling suggestion "
	
	^ [ self accessNode: 'CorrectedQuery' ]
	on: BioNotFoundObject
	do: [ : ex | String empty ]

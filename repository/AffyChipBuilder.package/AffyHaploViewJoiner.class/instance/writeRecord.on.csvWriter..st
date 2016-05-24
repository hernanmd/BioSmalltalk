accessing
writeRecord: record on: str csvWriter: csvWriter

	"self haltIf: [ record first = 'AX-28478436' ]."
	(record fifth splitOn: ' /// ') do: [ : fqs |
		| frqs |
		frqs := fqs splitOn: ' // '.
		self families
			detect: [ : e | e = (frqs at: 3) ]
			ifFound: [ : e | df at: e put: frqs first -> frqs second ]
			ifNone: [ self halt ] ].
	{ record first . record second . record third . record fourth . record sixth } do: [ : f |
		csvWriter writeField: f trimBoth; writeSeparator ].
		famNamesAB do: [ : famAB | 
			| alleleA alleleB |
			alleleA := df at: (famAB first: 3) ifPresent: [ :a | a isNil ifTrue: [ 'NULL' ] ifFalse: [ a key ] ] ifAbsent: [ 'NULL' ].
			alleleB := df at: (famAB first: 3) ifPresent: [ :a | a isNil ifTrue: [ 'NULL' ] ifFalse: [ a value ] ] ifAbsent: [ 'NULL' ] .
			csvWriter writeField: alleleA trimBoth; writeSeparator; writeField: alleleB trimBoth; writeSeparator ].
	df associationsDo: [ : assoc | assoc value: nil ].
	csvWriter writeEndOfLine 

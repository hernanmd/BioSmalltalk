report
extractGeneAnnotFromRecord: aString 

	| annTuple emblAnn nmAnn |
	
	annTuple := OrderedCollection new: 24.
	aString notNil 
		ifTrue: [ (aString splitOn: ' /// ') do: [ : annSet | annTuple add: (annSet splitOn: ' // ') ] ].
	emblAnn := annTuple select: [ : ann | ann first beginsWith: 'ENS' ].
	nmAnn := annTuple select: [ : ann | ann first beginsWith: 'NM' ].
	[ emblAnn size = 12 ] whileFalse: [ emblAnn add:  #('---' '---' '---' '---' '---' '---' '---') ].
	[ nmAnn size = 12 ] whileFalse: [ nmAnn add:  #('---' '---' '---' '---' '---' '---' '---') ].
	^ emblAnn , nmAnn
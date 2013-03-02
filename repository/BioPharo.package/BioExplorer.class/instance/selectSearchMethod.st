user interface
selectSearchMethod
	" Private - Answer a <Symbol> to be used for selecting in sub-searches "
	
	^ self useExactMatch 
		ifTrue: [ #includes: ]
		ifFalse: [ #includesLike: ]
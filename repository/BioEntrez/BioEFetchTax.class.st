"
http://www.ncbi.nlm.nih.gov/corehtml/query/static/efetchtax_help.html
"
Class {
	#name : 'BioEFetchTax',
	#superclass : 'BioEFetchCmd',
	#category : 'BioEntrez-Commands',
	#package : 'BioEntrez',
	#tag : 'Commands'
}

{ #category : 'testing' }
BioEFetchTax class >> validParameters [
	" Private - See superimplementor´s comment "
	
	^ super validParameters , #('report')
]

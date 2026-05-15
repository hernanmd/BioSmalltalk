"
http://www.ncbi.nlm.nih.gov/corehtml/query/static/efetchseq_help.html#retparam
"
Class {
	#name : 'BioEFetchSeq',
	#superclass : 'BioEFetchRetCmd',
	#category : 'BioEntrez-Commands',
	#package : 'BioEntrez',
	#tag : 'Commands'
}

{ #category : 'testing' }
BioEFetchSeq class >> validParameters [
	" Private - See superimplementor´s comment "
	
	^ super validParameters , #('seq_start' 'seq_stop' 'complexity')
]

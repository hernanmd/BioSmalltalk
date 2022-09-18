"
A BioNCBIBlastWrapper is an abstract class for local and remote NCBI Blast wrappers.

"
Class {
	#name : #BioNCBIBlastWrapper,
	#superclass : #BioBlastWrapper,
	#category : #'BioBlast-Local'
}

{ #category : #'instance creation' }
BioNCBIBlastWrapper class >> local [
	"Answer a <Class> for local BLAST usage"
	
	^ BioNCBILocalBlastWrapper

]

{ #category : #'instance creation' }
BioNCBIBlastWrapper class >> remote [
	" Answer the corresponding subclass for remote usage "
	
	^ BioNCBIWebBlastWrapper
	
]

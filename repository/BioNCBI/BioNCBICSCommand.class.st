Class {
	#name : #BioNCBICSCommand,
	#superclass : #BioNCBICommand,
	#category : 'BioNCBI-Commands'
}

{ #category : #'accessing private' }
BioNCBICSCommand >> blastMegablastService [
	" Blast service which needs to be performed "
	
	self client queryAt: 'SERVICE' put: 'megablast'
]

{ #category : #'accessing private' }
BioNCBICSCommand >> blastPhiService [
	" Blast service which needs to be performed "
	
	self client queryAt: 'SERVICE'  put: 'phi'
]

{ #category : #'accessing private' }
BioNCBICSCommand >> blastPlainService [
	" Blast service which needs to be performed "
	
	self client queryAt: 'SERVICE' put: 'plain'
]

{ #category : #'accessing private' }
BioNCBICSCommand >> blastPsiService [
	" Blast service which needs to be performed "
	
	self client queryAt: 'SERVICE' put: 'psi'
]

{ #category : #'accessing private' }
BioNCBICSCommand >> blastRpsService [
	" Blast service which needs to be performed "
	
	self client queryAt: 'SERVICE' put: 'rpsblast'
]

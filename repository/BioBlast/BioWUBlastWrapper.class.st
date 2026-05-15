"
Wrapper for WU-BLAST (Washington University BLAST). Extends BioBlastWrapper with WU-BLAST-specific program access.
"
Class {
	#name : 'BioWUBlastWrapper',
	#superclass : 'BioBlastWrapper',
	#category : 'BioBlast-Remote',
	#package : 'BioBlast',
	#tag : 'Remote'
}

{ #category : 'instance creation' }
BioWUBlastWrapper class >> local [
	" Answer the corresponding subclass for local usage "
	
	self flag: #toDo.
	^ nil
	
]

{ #category : 'instance creation' }
BioWUBlastWrapper class >> remote [
	" Answer the corresponding subclass for remote usage "
	
	self flag: #toDo.
	^ nil
	
]

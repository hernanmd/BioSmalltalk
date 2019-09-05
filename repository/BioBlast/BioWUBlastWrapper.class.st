Class {
	#name : #BioWUBlastWrapper,
	#superclass : #BioBlastWrapper,
	#category : 'BioBlast-Remote'
}

{ #category : #'instance creation' }
BioWUBlastWrapper class >> local [
	" Answer the corresponding subclass for local usage "
	
	self flag: #toDo.
	^ nil
	
]

{ #category : #'instance creation' }
BioWUBlastWrapper class >> remote [
	" Answer the corresponding subclass for remote usage "
	
	self flag: #toDo.
	^ nil
	
]

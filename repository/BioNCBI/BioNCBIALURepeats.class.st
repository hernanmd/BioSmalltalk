Class {
	#name : #BioNCBIALURepeats,
	#superclass : #BioNCBIDatabase,
	#category : 'BioNCBI-Databases'
}

{ #category : #accessing }
BioNCBIALURepeats class >> dbName [

	^ 'alu_repeats'
]

{ #category : #accessing }
BioNCBIALURepeats class >> description [

	^ 'Human ALU repeat elements: ' , self dbName
]

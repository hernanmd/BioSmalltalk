Class {
	#name : #BionCoV2019GD,
	#superclass : #BioNCBIGenomeDownloader,
	#category : #'BioNCBI-Genomes'
}

{ #category : #downloading }
BionCoV2019GD >> download [

	self connectionSettings serverDirectory: self defaultDirectory.
	self download
]

{ #category : #accessing }
BionCoV2019GD >> organismName [
	" Private - See superimplementor's comment "

	^ ''
]

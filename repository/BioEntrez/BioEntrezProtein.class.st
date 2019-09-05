Class {
	#name : #BioEntrezProtein,
	#superclass : #BioESeqCommonDb,
	#category : 'BioEntrez-Databases'
}

{ #category : #accessing }
BioEntrezProtein class >> dbName [
	" See superimplementor's comment "
	
	^ 'protein'

]

{ #category : #accessing }
BioEntrezProtein >> setGp [
	" Set the receiver's retrieval type to GenPept report format "
	
	self retrievalType: 'gp'
]

{ #category : #accessing }
BioEntrezProtein >> setGpc [
	" Set the receiver's retrieval type to INSDSeq structured flat file format "
	
	self retrievalType: 'gpc'
]

"
Represents the Probe database in the NCBI Entrez system. Provides access to gene probe records.
"
Class {
	#name : 'BioEntrezProbe',
	#superclass : 'BioEntrezDatabase',
	#category : 'BioEntrez-Databases',
	#package : 'BioEntrez',
	#tag : 'Databases'
}

{ #category : 'accessing' }
BioEntrezProbe class >> dbName [
	" See superimplementor's comment "
	
	^ 'probe'

]

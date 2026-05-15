"
Represents the BioSystems database in the NCBI Entrez system. Provides access to biological pathway and system records.
"
Class {
	#name : 'BioEntrezBioSystems',
	#superclass : 'BioERetDatabase',
	#category : 'BioEntrez-Databases',
	#package : 'BioEntrez',
	#tag : 'Databases'
}

{ #category : 'accessing' }
BioEntrezBioSystems class >> dbName [
	" See superimplementor's comment "
	
	^ 'biosystems'

]

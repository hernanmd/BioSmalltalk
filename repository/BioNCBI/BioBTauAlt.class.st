"
Genomic DNA sequence released by The Bovine Genome Sequencing Consortium
"
Class {
	#name : #BioBTauAlt,
	#superclass : #BioBTauGD,
	#category : 'BioNCBI-Genomes'
}

{ #category : #testing }
BioBTauAlt class >> isAlternative [

	^ true
]

{ #category : #downloading }
BioBTauAlt >> defaultFileListPrefix [
	" Private - See superimplementor's comment "
	
	^ 'bt_alt_Btau_'
]

{ #category : #accessing }
BioBTauAlt >> latestVersionFound [
	" Private - See superimplementor's commemt "

	^ '5.0.1'
]

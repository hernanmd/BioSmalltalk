Class {
	#name : #BioRestriction,
	#superclass : #BioObject,
	#category : #'BioTools-Restriction'
}

{ #category : #accessing }
BioRestriction class >> downloadLocations [

	^ #(
		'http://rebase.neb.com/rebase/prod.txt'
		)
]

{ #category : #accessing }
BioRestriction class >> genBankAnnocationsFilepath [
	"Answer a <FileReference> of the GenBank annotated file"

	^ self openFileNamed: 'prod.txt'
]

{ #category : #accessing }
BioRestriction class >> readGenBankAnnotations [
	"Answer a <Collection> of GenBank annotations from REBASE"

	^ BioParser 
		tokenizeCSV: self genBankAnnocationsFilepath 
		delimiter: Character tab
]

{ #category : #accessing }
BioRestriction class >> readGenBankAnnotationsAsDataFrame [
	"Answer a <DataFrame> of GenBank annotations from REBASE"

	^ DataFrame 
		readFromCsv: self genBankAnnocationsFilepath 
		withColumnNames: #('Enzyme' 'Locus Tag' 'Product')
		separator: Character tab
]

{ #category : #'as yet unclassified' }
BioRestriction >> site [ 

	self subclassResponsibility
]

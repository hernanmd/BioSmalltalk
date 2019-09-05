"
BioCSVFileCollection serves to collect CSV files from a directory. It represents a collection of BioCSVFile's.

You may use it the following way:

BioCSVFileCollection filesFromDirectory: 'BioSmalltalkTestFiles\'

this way contained CSV files can be manipulated through specific methods in BioCSVFile class.

"
Class {
	#name : #BioCSVFileCollection,
	#superclass : #BioFileCollection,
	#category : 'BioFormatters-Core'
}

{ #category : #accessing }
BioCSVFileCollection class >> fileClass [
	" See superimplementor's comment "

	^ BioCSVFile
]

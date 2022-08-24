"
It represents a `Collection` of `BioFASTAFile` and  serves to collect FASTA files from a directory.

You may use it the following way:

```language=Pharo
BioFASTAFileCollection filesFromDirectory: 'BioSmalltalkTestFiles\'
```

this way, contained FASTA files can be manipulated through specific methods in `BioFASTAFile` class.

"
Class {
	#name : #BioFASTAFileCollection,
	#superclass : #BioFileCollection,
	#category : #'BioFormatters-Formatters-FASTA'
}

{ #category : #accessing }
BioFASTAFileCollection class >> fileClass [
	" See superimplementor's comment "

	^ BioFASTAFile
]

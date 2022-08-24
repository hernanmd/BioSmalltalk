"
The FASTA format is a text-based format for representing either nucleotide sequences or peptide sequences, in which nucleotides or amino acids are represented using single-letter codes. The format also allows for sequence names and comments to precede the sequences. The format originates from the FASTA software package, but has now become a standard in the field of bioinformatics.

To create a FASTA file specifying the full path string and access its contents:

```language=Pharo
| myFasta |
myFasta := BioFASTAFile on: 'c:\myFiles\Test001.fasta'.
myFasta contents.
```

"
Class {
	#name : #BioFASTAFile,
	#superclass : #BioFile,
	#category : #'BioFormatters-Formatters-FASTA'
}

{ #category : #accessing }
BioFASTAFile class >> possibleExtensions [
	" See superimplementor's comment"

	^ self fileFormatterClass fileExtensionsFor: 'FASTA'
]

{ #category : #accessing }
BioFASTAFile >> contents [
	" Answer receiver's contents "
	
	" This is due to a possibly bug in the parser objects "
	^ super contents withUnixLineEndings
]

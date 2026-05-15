"
Represents an ACE file format used in bioinformatics for representing sequence assembly data, typically output by assembly programs like phrap.
"
Class {
	#name : 'BioACEFile',
	#superclass : 'BioFile',
	#category : 'BioFormatters-Files',
	#package : 'BioFormatters',
	#tag : 'Files'
}

{ #category : 'examples' }
BioACEFile class >> example01 [

	| fh aceRecord |
	fh := '836CLEAN-100.fasta.cap.acc' asFileRefence.
	aceRecord := BioACEFile read: fh.
	aceRecord numberOfContigs.
	aceRecord numberOfReads.

	aceRecord contigsDo: [ : ctg |
		ctg contigName;
			numberOfBases;
			numberOfReads;
			numberOfSegments;
			sequence;
			quality.
		ctg readsDo: [ : read | 
			read readName;
				qaAlignClippingStart;
				qaAlignClippingEnd;
				readqaQualClippingStart;
				readqaQualClippingEnd;
				rdSequence. ].
		ctg readsCollect: [ : read | ].
		ctg readsSelect: [ : read | ] ].
	
]

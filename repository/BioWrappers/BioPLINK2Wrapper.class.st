"
Wrapper for PLINK software version ""2"" (or 1.90 actually). See superclass for additional documentation.
"
Class {
	#name : #BioPLINK2Wrapper,
	#superclass : #BioPLINKWrapper,
	#category : 'BioWrappers-Programs'
}

{ #category : #examples }
BioPLINK2Wrapper class >> example01 [

	BioPLINKWrapper new 
		file: 'myInputFile'; 	"Do not specify .ped extension !"
		out: 'myOutputFile';	" Do not specify output extension "
		makeBed;
		execute.
]

{ #category : #examples }
BioPLINK2Wrapper class >> example02 [

	BioPLINK2Wrapper new
		file: (self testFilesFullDirectoryName / 'sample_ped') fullName;
		out: 'sample_out';
		referenceAlleles: (self testFilesFullDirectoryName / 'reference_alleles.txt') fullName;
		makeBed;
		execute.
]

{ #category : #programs }
BioPLINK2Wrapper class >> plink [
	" Answer a <String> with the command line name "

	^ 'plink2'
]

{ #category : #accessing }
BioPLINK2Wrapper class >> softwareName [
	" See superimplementor's comment "

	^ 'PLINK2'
]

{ #category : #accessing }
BioPLINK2Wrapper class >> url [
	" See superimplementor's comment "

	^ 'https://www.cog-genomics.org/plink2'
]

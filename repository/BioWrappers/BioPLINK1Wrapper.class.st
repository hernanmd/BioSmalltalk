Class {
	#name : #BioPLINK1Wrapper,
	#superclass : #BioPLINKWrapper,
	#category : 'BioWrappers-Programs'
}

{ #category : #examples }
BioPLINK1Wrapper class >> example1 [

	BioPLINKWrapper new 
		file: 'myInputFile'; 	"Do not specify .ped extension !"
		out: 'myOutputFile';	" Do not specify output extension "
		noWeb;
		makeBed;
		execute.
]

{ #category : #accessing }
BioPLINK1Wrapper class >> softwareName [
	" See superimplementor's comment "

	^ 'PLINK'
]

{ #category : #accessing }
BioPLINK1Wrapper class >> url [
	" See superimplementor's comment "

	^ 'http://web.archive.org/web/20160829192650/http://pngu.mgh.harvard.edu/~purcell/plink/index.shtml'
]

{ #category : #options }
BioPLINK1Wrapper >> noWeb [
	" Add noweb option to PLINK "

	 ^ self addOption: 'noweb'
]

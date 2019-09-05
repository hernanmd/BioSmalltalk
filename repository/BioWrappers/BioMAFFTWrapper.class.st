Class {
	#name : #BioMAFFTWrapper,
	#superclass : #BioWrapperObject,
	#category : 'BioWrappers-Programs'
}

{ #category : #accessing }
BioMAFFTWrapper class >> softwareName [
	" See superimplementor's comment "

	^ 'Mafft'
]

{ #category : #accessing }
BioMAFFTWrapper class >> url [
	"WARNING: This is code generated automatically.
 On: 8 November 2012 - 9:58:12 pm"

	^ 'http://mafft.cbrc.jp/alignment/software/'
]

{ #category : #programs }
BioMAFFTWrapper >> mafft [
	"WARNING: This is code generated automatically.
 On: 8 November 2012 - 9:58:12 pm"

	^ 'mafft'
]

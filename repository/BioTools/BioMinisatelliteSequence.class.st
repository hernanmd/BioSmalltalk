"
Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.


    Implementation Points
"
Class {
	#name : #BioMinisatelliteSequence,
	#superclass : #BioRepeatSequence,
	#category : #'BioTools-Repeats'
}

{ #category : #examples }
BioMinisatelliteSequence class >> example01 [

	^ self new 
		motif: 'TGCGCCATTGTAGCCA';
		repeats: 3;
		yourself.
]

{ #category : #defaults }
BioMinisatelliteSequence >> defaultMaxMotifSize [
	" Microsatellite definition at the US National Library of Medicine Medical Subject Headings (MeSH) "
	
	^ 60
]

{ #category : #defaults }
BioMinisatelliteSequence >> defaultMinMotifSize [
	" Microsatellite definition at the US National Library of Medicine Medical Subject Headings (MeSH) "
	
	^ 10
]

{ #category : #testing }
BioMinisatelliteSequence >> isMinisatelliteSequence [
	" Answer <true> if the receiver represents a Minisatellite sequence "
	
	^ self
]

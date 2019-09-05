"
MCFileBasedRepository flushAllCaches.
Smalltalk garbageCollect.

BioBenchmarkTests fasta: 250000.


"
Class {
	#name : #BioBenchmarkTests,
	#superclass : #Object,
	#category : 'BioBenchmarks-Fasta'
}

{ #category : #benchmarking }
BioBenchmarkTests class >> alu [

	^ String streamContents: [ : stream | 
		stream 
			nextPutAll: 'GGCCGGGCGCGGTGGCTCACGCCTGTAATCCCAGCACTTTGG';
			nextPutAll: 'GAGGCCGAGGCGGGCGGATCACCTGAGGTCAGGAGTTCGAGA';
			nextPutAll: 'CCAGCCTGGCCAACATGGTGAAACCCCGTCTCTACTAAAAAT';
			nextPutAll: 'ACAAAAATTAGCCGGGCGTGGTGGCGCGCGCCTGTAATCCCA';
			nextPutAll: 'GCTACTCGGGAGGCTGAGGCAGGAGAATCGCTTGAACCCGGG';
			nextPutAll: 'AGGCGGAGGTTGCAGTGAGCCGAGATCGCGCCACTGCACTCC';
			nextPutAll: 'AGCCTGGGCGACAGAGCGAGACTCCGTCTCAAAAA' ]

]

{ #category : #'benchmark scripts' }
BioBenchmarkTests class >> fasta [

	self fasta: self arg to: FileStream stdout.
	^ String empty
]

{ #category : #'benchmark scripts' }
BioBenchmarkTests class >> fasta: n [

	self fasta: n to: FileStream stdout.
	^ String empty
]

{ #category : #benchmarking }
BioBenchmarkTests class >> fasta: n to: out [

	| r lineLength |
	lineLength := 60.
	self
		writeFasta: 'ONE Homo sapiens alu'
		from: (BioRepeatStream to: n * 2 on: self alu)
		to: out
		lineLength: lineLength.
	
	r := BioRandomNumber to: 1. "Shared random sequence"
	self
		writeFasta: 'TWO IUB ambiguity codes'
		from: ((BioRandomStream to: n * 3 on: self iub)
			random: r;
			yourself)
		to: out
		lineLength: lineLength.

	self
		writeFasta: 'THREE Homo sapiens frequency'
		from: ((BioRandomStream to: n * 5 on: self homoSapiens)
			random: r;
			yourself)
		to: out
		lineLength: lineLength.

   out flush.
]

{ #category : #benchmarking }
BioBenchmarkTests class >> homoSapiens [

	^ #(
		#($a 0.3029549426680d0)
		#($c 0.1979883004921d0)
		#($g 0.1975473066391d0)
		#($t 0.3015094502008d0)
		)
]

{ #category : #benchmarking }
BioBenchmarkTests class >> iub [

	^ #(
		#($a 0.27d0)
		#($c 0.12d0)
		#($g 0.12d0)
		#($t 0.27d0)

		#($B 0.02d0)
		#($D 0.02d0)
		#($H 0.02d0)
		#($K 0.02d0)
		#($M 0.02d0)
		#($N 0.02d0)
		#($R 0.02d0)
		#($S 0.02d0)
		#($V 0.02d0)
		#($W 0.02d0)
		#($Y 0.02d0)
		)
]

{ #category : #benchmarking }
BioBenchmarkTests class >> writeFasta: aString from: inStream to: outStream lineLength: lineLength [

	| i |
	outStream 
		nextPut: $>; 
		nextPutAll: aString; 
		cr.
	i := 0.
	[ inStream atEnd ] whileFalse:
	      [ i == lineLength ifTrue: [ outStream cr. i := 0 ].
	      outStream nextPut: inStream next.
	      i := i + 1 ].
   outStream 
		cr;
		flush.
]

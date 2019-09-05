"
Enables streaming behavior over biological sequence bases. You may use this class for counting bases in a file without instantiating all of them in memory, like a sequence does. For example:

(BioSequenceStream on: 'c:\your_file_with_a_sequence') length.

"
Class {
	#name : #BioSequenceStream,
	#superclass : #ReadWriteStream,
	#category : 'BioSupport-Core'
}

{ #category : #accessing }
BioSequenceStream >> length [
	" Answer an Integer of the number of bases in the receiver "

	| count |	
	
	self reset.
	count := 0.
	[ self atEnd ]
		whileFalse: [
			count := count + 1.
			self next ].
	^ count
]

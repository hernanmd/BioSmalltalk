"
Instance Variables:
	group	<ProtoObject | PseudoContext>
	data		<BioA31SampleParameters>
"
Class {
	#name : #BioA31Group,
	#superclass : #BioNamedObject,
	#instVars : [
		'group',
		'data'
	],
	#category : 'BioArlequin-Core'
}

{ #category : #accessing }
BioA31Group class >> description [

	^ 'Arlequin Group'
]

{ #category : #'instance creation' }
BioA31Group class >> fromBuilder: aGroupBuilder [

	^ aGroupBuilder groupSamples collect: [ : group | 
		self 
			named: group key name
			data: ((BioA31SampleParameters on: aGroupBuilder) buildSamplesAt: group value) ]
]

{ #category : #'instance creation' }
BioA31Group class >> named: aString data: sampleParams [
	" Answer a new Arlequin group "

	^ self new 
		name: aString;
		data: sampleParams;
		yourself
]

{ #category : #accessing }
BioA31Group >> data [
	^ data
]

{ #category : #accessing }
BioA31Group >> data: anObject [
	data := anObject
]

{ #category : #accessing }
BioA31Group >> group [
	^ group
]

{ #category : #accessing }
BioA31Group >> group: anObject [
	group := anObject
]

{ #category : #printing }
BioA31Group >> printOn: aStream [

	aStream 
		nextPutAll: self name
		between: $[ and: $].
	self data printOn: aStream.
]

{ #category : #accessing }
BioA31Group >> size [
	" For NbSamples setting "
	
	^ self data size
]

Extension { #name : #Interval }

{ #category : #'*BioWrappers' }
Interval >> asPLINKParameter [
	" Answer a <String> representation suitable to use as PLINK parameter "
	
	^ self first asString , '-' , self last asString
]

{ #category : #'*BioWrappers' }
Interval >> gtInspectorIntervalIn: composite [

	<gtInspectorPresentationOrder: 80>
	^ composite table
		title: 'Interval';
		display: [ { 
			'Range' -> self . 
			'Size' -> self size } ];
		column: 'Property' evaluated: #key;
		column: 'Value' evaluated: #value;		
		send: #value

]

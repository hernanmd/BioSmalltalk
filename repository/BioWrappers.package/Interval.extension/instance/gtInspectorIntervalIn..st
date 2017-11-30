*BioWrappers
gtInspectorIntervalIn: composite

	<gtInspectorPresentationOrder: 80>
	^ composite table
		title: 'Interval';
		display: [ { 
			'Range' -> self . 
			'Size' -> self size } ];
		column: 'Property' evaluated: #key;
		column: 'Value' evaluated: #value;		
		send: #value

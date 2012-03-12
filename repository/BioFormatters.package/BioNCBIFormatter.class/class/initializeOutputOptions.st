class initialization
initializeOutputOptions

	OutputOptions := 
		Dictionary new
			at: 'Separator' put: ( { 'Tab' . 'Space' . '|' . ';' . ',' } -> 'Separator character between columns in rows');
			at: 'Invariability' put: ( { '.' . '-' . '_' . '+' . 'Space' } -> 'Character used to specify invariability' );
			at: 'Extract GI List' put: 'Extract Gene Identity list in a separate file';
			at: 'Sequence Start Position' put: nil;
			at: 'Sequence End Position' put: nil;
			yourself.								

	
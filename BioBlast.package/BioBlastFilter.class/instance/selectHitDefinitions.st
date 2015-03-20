accessing
selectHitDefinitions

	^ self hits contents collect: [: h | h hitDefinition blastValue ]
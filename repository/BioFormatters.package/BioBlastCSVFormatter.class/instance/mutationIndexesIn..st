accessing
mutationIndexesIn: hitNode
	" Private - Answer a Collection of positions in alignmentCollection were there is a mutation "
	
	^ hitNode selectHspMidLine indicesOfCharacter: Character space
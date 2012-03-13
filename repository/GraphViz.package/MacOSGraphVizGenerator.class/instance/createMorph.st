generating
createMorph

	^  [(PNGReadWriter createAFormFrom: (self generateType: #png)) first asMorph] 
		ensure: [self cleanUpIntermediateFilesAsAppropriate]
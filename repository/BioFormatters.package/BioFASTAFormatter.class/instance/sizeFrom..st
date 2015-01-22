initialize-release
sizeFrom: collection

	^  collection sum: [: d | d sum: #size ]
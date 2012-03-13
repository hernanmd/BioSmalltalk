accessing
notationSection

	^ self notation trimBoth: [: each | each = $[ or: [ each = $] ] ]
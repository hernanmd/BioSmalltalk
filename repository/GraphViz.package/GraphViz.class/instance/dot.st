accessing
dot

	^ String streamContents:
		[:stream |
		self writeOn: stream withIndent: 0 for: self]
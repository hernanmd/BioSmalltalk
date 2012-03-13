generating
writeHtmlSvgFor: svgFile

	| fileName html |
	fileName := self outputFileNameFor: #html.
	html := FileStream forceNewFileNamed: fileName.
	[html nextPutAll: (self htmlSvgStringFor: svgFile)] ensure: [html close].

	^ fileName
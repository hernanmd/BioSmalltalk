accessing
parser

	^ parser
		ifNil: [ parser := self parserClass ]
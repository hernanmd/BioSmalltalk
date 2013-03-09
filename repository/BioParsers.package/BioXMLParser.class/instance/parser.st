accessing
parser

	^ parser
		ifNil: [ parser := XMLPullParser parse: self expression ]
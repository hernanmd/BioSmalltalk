*biotools
choose: r
	" Calculate n!/(r! * (n-r)!) where n is the receiver "

	^ self factorial / (r factorial * (self - r) factorial)
accessing
fontSize

	^ (self attributeAt: #fontsize ifAbsent: [14]) asNumber
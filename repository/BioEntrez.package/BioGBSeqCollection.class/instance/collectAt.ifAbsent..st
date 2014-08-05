accessing
collectAt: keyName ifAbsent: absentBlock

	^ self collect: [: d | d at: keyName ifAbsent: absentBlock ]
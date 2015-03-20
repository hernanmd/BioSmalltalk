private
reader

	^ reader
		ifNil: [ reader := self readerClass new results: self result ]
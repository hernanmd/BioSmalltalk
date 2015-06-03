private
writeOn: aWriteStream 
	self samples do: [ : each | each writeOn: aWriteStream ]
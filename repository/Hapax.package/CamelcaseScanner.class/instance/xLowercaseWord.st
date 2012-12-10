private
xLowercaseWord

	[	buffer nextPut: next.
		next := stream next.
		next isLowercase ] whileTrue.
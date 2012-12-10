running
apply

	self class ensureBinary.
	self deleteTempFiles.
	self writeInput.
	self runCommand.
	svd := SingularValueDecomposition
		withS: self readOutputS
		withU: self readOutputUt transposed
		withV: self readOutputVt transposed.
	svd comment: outputString.
	self deleteTempFiles.
	^svd
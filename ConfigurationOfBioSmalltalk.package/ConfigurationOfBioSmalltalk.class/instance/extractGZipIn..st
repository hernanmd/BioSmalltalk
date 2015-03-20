doits
extractGZipIn: dst
	" Uncompress fileRef contents and delete it "
	
	(fileRef fullName endsWith: '.gz')
		ifTrue: [ | unzipped |
			unzipped := GZipReadStream unzip: fileRef basename to: dst.
			OSProcess thisOSProcess waitForCommandOutput: 'tar xvf ' , unzipped asFileReference fullName.
			fileRef delete.
			unzipped asFileReference delete  ].
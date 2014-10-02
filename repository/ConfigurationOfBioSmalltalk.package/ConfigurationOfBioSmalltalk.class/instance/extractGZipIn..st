doits
extractGZipIn: dst
	" Uncompress fileRef contents and delete it "
	
	(fileRef fullName endsWith: '.gz')
		ifTrue: [ | unzipped |
			self halt.
			unzipped := GZipReadStream unzip: fileRef basename to: dst.
			" (dst / unzipped) renameTo: unzipped asFileReference basenameWithoutExtension."
			[ OSProcess thisOSProcess waitForCommandOutput: 'tar xvf ' , unzipped asFileReference fullName ]
			ensure: [ fileRef close ].
			fileRef delete ].
downloading
fileListPrefix: filePrefix
	^ Array
		with: filePrefix , self version , '_chr' , self chrAsString , '.fa.gz'
		with: filePrefix , self version , '_chr' , self chrAsString , '.gbk.gz'
		with: filePrefix , self version , '_chr' , self chrAsString , '.asn.gz'
		with: filePrefix , self version , '_chr' , self chrAsString , '.gbs.gz'
		with: filePrefix , self version , '_chr' , self chrAsString , '.mfa.gz'
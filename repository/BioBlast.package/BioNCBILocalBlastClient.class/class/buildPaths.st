private
buildPaths
	" Private - Evaluate this message every time a new version of the receiver is released "
	
	| programNames codeGenerator |
	
	codeGenerator := CGSmalltalk new setSourceAsCode; targetClass: self.
	programNames := self programNames collect: [: prg | prg copyUpTo: $. ].
	programNames do: [: prgName | 
		codeGenerator compile: ( self pathTemplate: prgName ) ]
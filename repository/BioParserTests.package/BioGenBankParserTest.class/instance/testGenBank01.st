testing
testGenBank01

	self assert: ( BioParser tokenizeAccession:  'gb|AAM45611.1|AF384285_1' ) = #('AAM45611' '1').	
	self assert: ( BioParser tokenizeLocus: 'gb|AAM45611.1|AF384285_1' ) = 'AF384285_1'.

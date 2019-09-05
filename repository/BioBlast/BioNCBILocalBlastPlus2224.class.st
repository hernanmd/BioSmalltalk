Class {
	#name : #BioNCBILocalBlastPlus2224,
	#superclass : #BioNCBILocalBlastWrapper,
	#category : 'BioBlast-Local'
}

{ #category : #testing }
BioNCBILocalBlastPlus2224 class >> isLatestVersion [

	^ true
]

{ #category : #testing }
BioNCBILocalBlastPlus2224 class >> isLegacyVersion [
	" Answer <true> because receiver's is the latest version "
	
	^ false
]

{ #category : #private }
BioNCBILocalBlastPlus2224 class >> programNames [
	" Answer a list of program names for resolving their path to execute them "
	
	^ #('blast_formatter.exe'      
'blastdb_aliastool.exe'    
'blastdbcheck.exe'        
'blastdbcmd.exe'           
'blastn.exe'               
'blastp.exe'               
'blastx.exe'
'convert2blastmask.exe'    
'dustmasker.exe'           
'makeblastdb.exe'          
'makembindex.exe'          
'psiblast.exe'             
'rpsblast.exe'             
'rpstblastn.exe'           
'segmasker.exe'            
'tblastn.exe'              
'tblastx.exe'        
'windowmasker.exe') 
]

{ #category : #accessing }
BioNCBILocalBlastPlus2224 class >> versionNumber [
	" Answer a Number of the receiver's version "

	^ 2224
]

{ #category : #path }
BioNCBILocalBlastPlus2224 >> blastdbaliastoolPath [
	" Answer a String with the full path to the receiver's binary "
	
	^  self programNamed: 'blastdb_aliastool'
]

{ #category : #path }
BioNCBILocalBlastPlus2224 >> blastdbcheckPath [
	" Answer a String with the full path to the receiver's binary "
	
	^  self programNamed: 'blastdbcheck'
]

{ #category : #path }
BioNCBILocalBlastPlus2224 >> blastdbcmdPath [
	" Answer a String with the full path to the receiver's binary "
	
	^  self programNamed: 'blastdbcmd'
]

{ #category : #path }
BioNCBILocalBlastPlus2224 >> blastformatterPath [
	" Answer a String with the full path to the receiver's binary "
	
	^  self programNamed: 'blast_formatter'
]

{ #category : #path }
BioNCBILocalBlastPlus2224 >> blastnPath [
	" Answer a String with the full path to the receiver's binary "
	
	^  self programNamed: 'blastn'
]

{ #category : #path }
BioNCBILocalBlastPlus2224 >> blastpPath [
	" Answer a String with the full path to the receiver's binary "
	
	^  self programNamed: 'blastp'
]

{ #category : #path }
BioNCBILocalBlastPlus2224 >> blastxPath [
	" Answer a String with the full path to the receiver's binary "
	
	^  self programNamed: 'blastx'
]

{ #category : #path }
BioNCBILocalBlastPlus2224 >> convert2blastmaskPath [
	" Answer a String with the full path to the receiver's binary "
	
	^  self programNamed: 'convert2blastmask'
]

{ #category : #path }
BioNCBILocalBlastPlus2224 >> dustmaskerPath [
	" Answer a String with the full path to the receiver's binary "
	
	^  self programNamed: 'dustmasker'
]

{ #category : #private }
BioNCBILocalBlastPlus2224 >> mainExecName [
	" Answer a String with a receiver's program name "
	
	^ 'blastn'
]

{ #category : #path }
BioNCBILocalBlastPlus2224 >> makeblastdbPath [
	" Answer a String with the full path to the receiver's binary "
	
	^  self programNamed: 'makeblastdb'
]

{ #category : #path }
BioNCBILocalBlastPlus2224 >> makembindexPath [
	" Answer a String with the full path to the receiver's binary "
	
	^  self programNamed: 'makembindex'
]

{ #category : #path }
BioNCBILocalBlastPlus2224 >> psiblastPath [
	" Answer a String with the full path to the receiver's binary "
	
	^  self programNamed: 'psiblast'
]

{ #category : #path }
BioNCBILocalBlastPlus2224 >> rpsblastPath [
	" Answer a String with the full path to the receiver's binary "
	
	^  self programNamed: 'rpsblast'
]

{ #category : #path }
BioNCBILocalBlastPlus2224 >> rpstblastnPath [
	" Answer a String with the full path to the receiver's binary "
	
	^  self programNamed: 'rpstblastn'
]

{ #category : #path }
BioNCBILocalBlastPlus2224 >> segmaskerPath [
	" Answer a String with the full path to the receiver's binary "
	
	^  self programNamed: 'segmasker'
]

{ #category : #path }
BioNCBILocalBlastPlus2224 >> tblastnPath [
	" Answer a String with the full path to the receiver's binary "
	
	^  self programNamed: 'tblastn'
]

{ #category : #path }
BioNCBILocalBlastPlus2224 >> tblastxPath [
	" Answer a String with the full path to the receiver's binary "
	
	^  self programNamed: 'tblastx'
]

{ #category : #path }
BioNCBILocalBlastPlus2224 >> windowmaskerPath [
	" Answer a String with the full path to the receiver's binary "
	
	^  self programNamed: 'windowmasker'
]

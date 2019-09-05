"
BioIUPACProteinExtended 

From IUPACData.py (2011)
#   B = ""Asx"";  aspartic acid or asparagine (D or N)
#   X = ""Xxx"";  unknown or 'other' amino acid
#   Z = ""Glx"";  glutamic acid or glutamine (E or Q)
#   J = ""Xle"";  leucine or isoleucine (L or I, used in mass-spec)
#   U = ""Sec"";  selenocysteine
#   O = ""Pyl"";  pyrrolysine


"
Class {
	#name : #BioIUPACProteinExtended,
	#superclass : #BioIUPACProtein,
	#category : #'BioTools-Alphabets'
}

{ #category : #accessing }
BioIUPACProteinExtended class >> codes [

	^ 'ACDEFGHIKLMNPQRSTVWYBXZJUO'
]

{ #category : #printing }
BioIUPACProteinExtended >> printOn: aStream [
	" See superimplementor's comment "
	
	super printOn: aStream.
	aStream nextPutAll: '-> Extended'
]

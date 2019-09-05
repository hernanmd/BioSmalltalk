"
BioErrorSpecificationObject should not be used directly. 
Should be raised for handling 
	- Empty results
	- Invalid parameters
	- Limits were reached

and in the following way:

self signalInvalidObject: 'message' , ex messageText.
"
Class {
	#name : #BioErrorSpecificationObject,
	#superclass : #BioException,
	#category : #'BioTools-Exceptions'
}

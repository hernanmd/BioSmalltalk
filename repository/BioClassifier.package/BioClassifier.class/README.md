A BioClassifier is a generic classifier for Bioinformatics projects.

Subclasses could implement binary, multiclass, single-label, hard or soft classification. This class imposes no restriction on different types of classifiers.

It provides accessing to matched and mismatched elements, an "organization" and the current item being classified called "subject".

The organization object is responsible to hold the "Classes". These are NOT Smalltalk classes but Classes in the statistical classification sense (class is like a label to assign to a subject).

Instance Variables
	matches:			<Collection>
	mismatches:		<Collection>
	organization:		<Object>
	ruleBase:			<Object>
	subject:			<Object>			Current observation being processed by the classifier

matches
	- xxxxx

mismatches
	- xxxxx

organization
	- xxxxx

ruleBase
	- xxxxx

subject
	- xxxxx

A BioClassifier is a generic classifier for Bioinformatics projects.

Subclasses could implement binary, multiclass, single-label, hard or soft classification. This class imposes no restriction on different types of classifiers.

It provides accessing to matched and mismatched elements, an "organization" and the current item being classified - the observation -  called "subject".

The organization object is responsible to hold the "Classes". These are NOT Smalltalk classes but Classes in the statistical classification sense (class is like a label to assign to a subject).

The classifier supports matching at different classes:

1) When using #atMatchesPut: the classifier add the parameter in a default matching entry, meaning the parameter just matched a condition.  The default class name is just #default.
2) When using #atMatchClass:put: the classifier stores the parameter in the supplied "class" (again, not a Smalltalk class but a String or Symbol which identifies the organization).

Instance Variables
	matches:			<Collection>
	mismatches:			<Collection>
	organization:		<Object>
	subject:				<Object>			Current observation being processed by the classifier

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

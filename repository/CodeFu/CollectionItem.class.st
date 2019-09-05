Class {
	#name : #CollectionItem,
	#superclass : #Collection,
	#instVars : [
		'item',
		'collection'
	],
	#category : 'CodeFu'
}

{ #category : #adding }
CollectionItem >> add: newObject [
	" *** This method was defined by Collection as a subclass responsibility.
	Replace its body with a proper implementation. *** "

	self error: 'Subclass responsibility stub not reimplemented'
]

{ #category : #accessing }
CollectionItem >> collection [
	^collection
]

{ #category : #accessing }
CollectionItem >> collection: anObject [
	collection := anObject
]

{ #category : #enumerating }
CollectionItem >> do: aBlock [
	" *** This method was defined by Collection as a subclass responsibility.
	Replace its body with a proper implementation. *** "

	self error: 'Subclass responsibility stub not reimplemented'
]

{ #category : #accessing }
CollectionItem >> item [
	^item
]

{ #category : #accessing }
CollectionItem >> item: anObject [
	item := anObject
]

{ #category : #removing }
CollectionItem >> remove: oldObject ifAbsent: anExceptionBlock [
	" *** This method was defined by Collection as a subclass responsibility.
	Replace its body with a proper implementation. *** "

	self error: 'Subclass responsibility stub not reimplemented'
]

Class {
	#name : #DaDeprecation,
	#superclass : #DeprecationModel,
	#instVars : [
		'className',
		'selector'
	],
	#category : #DeprecationAnalysis
}

{ #category : #comparing }
DaDeprecation >> = anObject [

	super = anObject
		ifFalse: [ ^ false ].
		
	^ className = anObject className and: [ 
		selector = anObject selector ]
]

{ #category : #converting }
DaDeprecation >> asTsvRow [

	| antecedent consequent msg |
	
	antecedent := ''.
	consequent := ''.
	
	transformationRule ifNotNil: [ 
		transformationRule antecedent ifNotNil: [ :str |
			antecedent := self replaceAllWhitespacesWithSpacesIn: str ].
		
		transformationRule consequent ifNotNil: [ :str |
			consequent := self replaceAllWhitespacesWithSpacesIn: str ]. ].
	
	msg := self replaceAllWhitespacesWithSpacesIn: message asString.	

	^ String streamContents: [ :stream |
		stream
			nextPutAll: className; tab;
			nextPutAll: selector; tab;
			nextPutAll: msg; tab;
			nextPutAll: antecedent; tab;
			nextPutAll: consequent ].
]

{ #category : #accessing }
DaDeprecation >> className [

	^ className
]

{ #category : #accessing }
DaDeprecation >> className: anObject [

	className := anObject
]

{ #category : #comparing }
DaDeprecation >> hash [

	^ super hash bitXor: (className hash bitXor: selector hash)
]

{ #category : #'as yet unclassified' }
DaDeprecation >> replaceAllWhitespacesWithSpacesIn: aString [

	^ ' ' join: aString substrings
]

{ #category : #accessing }
DaDeprecation >> selector [

	^ selector
]

{ #category : #accessing }
DaDeprecation >> selector: anObject [

	selector := anObject
]

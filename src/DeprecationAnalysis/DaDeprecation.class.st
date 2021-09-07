Class {
	#name : #DaDeprecation,
	#superclass : #DeprecationModel,
	#instVars : [
		'className',
		'selector'
	],
	#category : #DeprecationAnalysis
}

{ #category : #converting }
DaDeprecation >> asTsvRow [

	^ String streamContents: [ :stream |
		stream
			nextPutAll: className; tab;
			nextPutAll: selector; tab;
			nextPutAll: message asString; tab;
			nextPutAll: (transformationRule antecedent ifNil: [ '' ]); tab;
			nextPutAll: (transformationRule consequent ifNil: [ '' ]) ].
]

{ #category : #accessing }
DaDeprecation >> className [

	^ className
]

{ #category : #accessing }
DaDeprecation >> className: anObject [

	className := anObject
]

{ #category : #accessing }
DaDeprecation >> message [

	^ message
]

{ #category : #accessing }
DaDeprecation >> message: anObject [

	message := anObject
]

{ #category : #accessing }
DaDeprecation >> selector [

	^ selector
]

{ #category : #accessing }
DaDeprecation >> selector: anObject [

	selector := anObject
]

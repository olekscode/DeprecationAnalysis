Class {
	#name : #DeprecationWithUseCategory,
	#superclass : #NonTransformingCategory,
	#category : #'DeprecationAnalysis-Classification'
}

{ #category : #accessing }
DeprecationWithUseCategory >> condition [ 
	^ [ :deprecation | deprecation message isString and: [ deprecation message asLowercase includesSubstring: 'use' ] ]
]

{ #category : #accessing }
DeprecationWithUseCategory >> name [ 
	^ 'Includes ''use'''
]

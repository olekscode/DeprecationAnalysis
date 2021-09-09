Class {
	#name : #DeprecationWithUseInsteadCategory,
	#superclass : #DeprecationWithUseCategory,
	#category : #'DeprecationAnalysis-Classification'
}

{ #category : #accessing }
DeprecationWithUseInsteadCategory >> condition [
	^ [ :deprecation | deprecation message asLowercase includesSubstring: 'instead' ]
]

{ #category : #accessing }
DeprecationWithUseInsteadCategory >> name [
	^ 'Includes ''use instead'''
]

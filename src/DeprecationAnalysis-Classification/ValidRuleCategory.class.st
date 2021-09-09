Class {
	#name : #ValidRuleCategory,
	#superclass : #CanParseRuleCategory,
	#category : #'DeprecationAnalysis-Classification'
}

{ #category : #testing }
ValidRuleCategory >> condition [
	^ [ :deprecation | deprecation transformationRule isValid ]
]

{ #category : #accessing }
ValidRuleCategory >> name [
	^ 'Valid'
]

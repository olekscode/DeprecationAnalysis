Class {
	#name : #InvalidRuleCategory,
	#superclass : #CanParseRuleCategory,
	#category : #'DeprecationAnalysis-Classification'
}

{ #category : #accessing }
InvalidRuleCategory >> condition [ 
	^ ValidRuleCategory new condition not
]

{ #category : #accessing }
InvalidRuleCategory >> name [
	^ 'Invalid'
]

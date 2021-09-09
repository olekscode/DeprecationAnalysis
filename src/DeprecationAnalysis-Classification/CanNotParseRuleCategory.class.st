Class {
	#name : #CanNotParseRuleCategory,
	#superclass : #TransformingCategory,
	#category : #'DeprecationAnalysis-Classification'
}

{ #category : #accessing }
CanNotParseRuleCategory >> condition [
	^ [ :deprecation | deprecation transformationRule hasParsingError ]
]

{ #category : #accessing }
CanNotParseRuleCategory >> name [
	^ 'Can not be parsed'
]

Class {
	#name : #DifferentReceiverRuleCategory,
	#superclass : #OneToOneRuleCategory,
	#category : #'DeprecationAnalysis-Classification'
}

{ #category : #accessing }
DifferentReceiverRuleCategory >> condition [
	^ SameReceiverRuleCategory new condition not
]

{ #category : #accessing }
DifferentReceiverRuleCategory >> name [
	^ 'Different receiver'
]

Class {
	#name : #CascadeMessageRuleCategory,
	#superclass : #OneToManyRuleCategory,
	#category : #'DeprecationAnalysis-Classification'
}

{ #category : #accessing }
CascadeMessageRuleCategory >> condition [ 
	^ [ :deprecation | deprecation transformationRule parseConsequentTree isCascade ]
]

{ #category : #accessing }
CascadeMessageRuleCategory >> name [ 
	^ 'Cascade message'
]

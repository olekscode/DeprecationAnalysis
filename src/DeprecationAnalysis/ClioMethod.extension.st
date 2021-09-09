Extension { #name : #ClioMethod }

{ #category : #'*DeprecationAnalysis' }
ClioMethod >> asDaDeprecation [
	
	deprecation ifNil: [ self error: 'This method is not deprecated' ].

	^ DaDeprecation new
		packageName: methodClass package name;
		className: self fullClassName;
		selector: name;
		message: deprecation message;
		transformationRule: deprecation transformationRule;
		condition: deprecation condition;
		date: deprecation date;
		version: deprecation version.
]

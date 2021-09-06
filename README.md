# DeprecationAnalysis

[![Build status](https://github.com/olekscode/DeprecationAnalysis/workflows/CI/badge.svg)](https://github.com/olekscode/DeprecationAnalysis/actions/workflows/test.yml)
[![Coverage Status](https://coveralls.io/repos/github/olekscode/DeprecationAnalysis/badge.svg?branch=master)](https://coveralls.io/github/olekscode/DeprecationAnalysis?branch=master)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/olekscode/DeprecationAnalysis/master/LICENSE)

Analysis of deprecations in Pharo images.

## How to install it?

To install `DeprecationAnalysis`, go to the Playground (Ctrl+OW) in your [Pharo](https://pharo.org/) image and execute the following Metacello script (select it and press Do-it button or Ctrl+D):

```Smalltalk
Metacello new
  baseline: 'DeprecationAnalysis';
  repository: 'github://olekscode/DeprecationAnalysis/src';
  load.
```

## How to depend on it?

If you want to add a dependency on `DeprecationAnalysis` to your project, include the following lines into your baseline method:

```Smalltalk
spec
  baseline: 'DeprecationAnalysis'
  with: [ spec repository: 'github://olekscode/DeprecationAnalysis/src' ].
```

If you are new to baselines and Metacello, check out the [Baselines](https://github.com/pharo-open-documentation/pharo-wiki/blob/master/General/Baselines.md) tutorial on Pharo Wiki.

## How to use it?

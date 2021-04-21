## 2.5.0

* **Breaking change:** Now in the `toMap<K, V>` method, the converted key is passed as the second parameter to the `valueBuilder` and `valueRawBuilder` callbacks.

## 2.0.2

* The `toBool` method now returns a null-safe type.

## 2.0.1

* The `toList<T>` method can now return a list of `Map` values that have been cast to the required type.

## 2.0.0

* Added the `toMap<K, V>` method to support typed `Map` classes.
* Types and parameters are now specified in builders.

## 2.0.0-nullsafety.4

* Improved `toList<T>` method to support different `Iterable` classes.

## 2.0.0-nullsafety.3

* In the `to<T>` and `toList<T>` methods, the `defaultValue` argument type has been changed from `dynamic` to `T?`/`List<T>?`.

## 2.0.0-nullsafety.2

* Operator `[]` now returns type `DynamicValue` instead of type `dynamic`. 

## 2.0.0-nullsafety.1

* Migrate to null safety.

## 1.0.1+1

* Operator `[]` now returns type `DynamicValue` instead of type `dynamic`. 

## 1.0.1

* Fixed bug in `.toList()` method.
* Added examples.

## 1.0.0+1

* Initial version

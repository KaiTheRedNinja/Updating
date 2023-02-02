# Updating

`Updating` is a property wrapper that reads and stays updated to a value owned by a source of truth.

Use a `Updating` to create a one-way connection between a property that stores data, and a view that displays the data.
An `Updating` connects a property to a source of truth stored elsewhere, instead of storing data directly, similar to `Binding`.
However, it does not have the ability to write to its source of truth.

## Usage
```swift
struct MyText: View {
    @Updating var string: String
    var body: some View {
        Text(string)
    }
}
```
The parent view declares a property to hold the string state, using the State property wrapper to indicate that this property is the value’s source of truth.
```swift
struct TextEditingView: View {
    @State private var string: String = "test"
    var body: some View {
        VStack {
            TextField("Enter Text Here", $string)
            MyText(string)
        }
    }
}
```
When TextEditingView initializes MyText, it passes an `Updating` of its state property into the button’s `Updating` property.
Whenever the user changes the text, MyText updates its `string` state. This differs from state, as state only takes the
initial value and any updates done in the parent view would not be reflected in the child view.

## Adding to a project
Using Swift Package Manager: `File -> Add Packages`, then input the URL of this github repo

## Implementation Details
Updating turns its `Value` into an `autoclosure` for `() -> Value`. In SwiftUI, whenever a value in a closure changes,
SwiftUI is forced to re-evaluate the closure, which allows `Updating` to stay synced with its source of truth.

## Usage outside of SwiftUI
Updating works outside of SwiftUI, like in the following example:
```swift
var testString: String = "initial"
let updating = Updating(wrappedValue: testString)
testString = "changed!"
print(updating.wrappedValue) // "changed!"
```

## Custom prefix operator
Instead of using `self._myValue = Updating(wrappedValue: myValue)`, you can use `self._myValue = <-myValue`

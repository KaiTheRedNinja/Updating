import XCTest
@testable import Updated

final class UpdatedSwiftUITests: XCTestCase {
    func testUpdating() throws {
        var testString: String = "initial"
        let updating = <-testString
        testString = "changed!"
        XCTAssertEqual(testString, updating.wrappedValue)
    }
}

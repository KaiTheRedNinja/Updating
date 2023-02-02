import XCTest
@testable import UpdatedSwiftUI

final class UpdatedSwiftUITests: XCTestCase {
    func testUpdating() throws {
        var testString: String = "initial"
        let updating = Updating(wrappedValue: testString)
        testString = "changed!"
        XCTAssertEqual(testString, updating.wrappedValue)
    }
}

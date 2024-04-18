import XCTest
import SnapshotTesting
@testable import OSRM

final class TestDecodeOSRM: XCTestCase {

    var routeData: Data!
    
    override func setUpWithError() throws {
        let routeURL = Bundle.module.url(forResource: "TestData/route", withExtension: "json")!
        routeData = try Data(contentsOf: routeURL)
    }

    func testDecodeRouteResponse() throws {
        let decoded = try JSONDecoder().decode(RouteResponse.self, from: routeData)
        assertSnapshot(of: decoded, as: .json)
    }
    
}

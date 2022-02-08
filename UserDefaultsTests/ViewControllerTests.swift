@testable import UserDefaults
import XCTest

final class ViewControllerTests: XCTestCase {
    private var viewController: ViewController!
    private var defaults: FakeUserDefaults!
    
    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        viewController = storyboard.instantiateViewController(identifier: String(describing: ViewController.self))
        defaults = FakeUserDefaults()
        viewController.userDefaults = defaults

    }
    
    override func tearDown() {
        viewController = nil
        defaults = nil
        super.tearDown()
    }
    
    func test_viewDidLoad_withEmptyUserDefaults_shouldShow0InCounterLabel() throws {
        viewController.loadViewIfNeeded()
        
        XCTAssertEqual(viewController.counterLabel.text, "0")
    }
    
    func test_viewDidLoad_with7InUserDefaults_shouldShow7InCounterLabel() {
        defaults.integers = ["count": 7]
        
        viewController.loadViewIfNeeded()
        
        XCTAssertEqual(viewController.counterLabel.text, "7")
    }
}

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
    
    func test_tappingButton_with12InUserDefaults_shouldWrite13ToUserDefaults() {
        defaults.integers = ["count": 12]
        viewController.loadViewIfNeeded()
        
        tap(viewController.incrementButton)
        
        XCTAssertEqual(defaults.integers["count"], 13)
    }
    
    func test_tappingButton_with42InUserDefaults_shouldShow43InCounterLabel() {
        defaults.integers = ["count": 42]
        viewController.loadViewIfNeeded()
        
        tap(viewController.incrementButton)
        
        XCTAssertEqual(viewController.counterLabel.text, "43")
    }
}

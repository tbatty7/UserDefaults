//
//  ViewController.swift
//  UserDefaults
//
//  Created by Timothy D Batty on 2/8/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet private(set) var incrementButton: UIButton!
    @IBOutlet private(set) var counterLabel: UILabel!
    
    var userDefaults: UserDefaultsProtocol = UserDefaults.standard
    
    private var count = 0 {
        didSet {
            counterLabel.text = "\(count)"
            userDefaults.set(count, forKey: "count")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        count = userDefaults.integer(forKey: "count")
    }

    @IBAction private func incrementButtonTapped() {
        count += 1
    }
}

extension UserDefaults: UserDefaultsProtocol {}
protocol UserDefaultsProtocol {
    func set(_ value: Int, forKey defaultName: String)
    func integer(forKey defaultName: String) -> Int
}

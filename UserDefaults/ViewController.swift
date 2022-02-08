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
    
    private var count = 0 {
        didSet {
            counterLabel.text = "\(count)"
            UserDefaults.standard.set(count, forKey: "count")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        count = UserDefaults.standard.integer(forKey: "count")
    }

    @IBAction private func incrementButtonTapped() {
        count += 1
    }
}


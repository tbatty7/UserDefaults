//
//  FakeUserDefaults.swift
//  UserDefaultsTests
//
//  Created by Timothy D Batty on 2/8/22.
//

@testable import UserDefaults

class FakeUserDefaults: UserDefaultsProtocol {
    
    var integers: [String: Int] = [:]
    
    func set(_ value: Int, forKey defaultName: String) {
        integers[defaultName] = value
    }
    
    func integer(forKey defaultName: String) -> Int {
        integers[defaultName] ?? 0
    }
    
    
}

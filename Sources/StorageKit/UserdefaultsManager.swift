//
//  UserdefaultsManager.swift
//  MakeenFull
//
//  Created by Mahmoud Aziz on 19/05/2022.
//

import Foundation

class UserDefaultsManager: UserDefaultsManagerContract {
    
    private let standard = UserDefaults.standard
    
    static let shared = UserDefaultsManager()
    
    /// Save value to UserDefaults.
    /// Use this helper to save light and non-sensitive data, for ex: Theme version.
    func save(_ value: String, key: UserDefaultsKey) {
        standard.set(value, forKey: key.rawValue)
    }
    
    /// Save codable object to UserDefaults.
    func save<Element: Codable>(value: Element, forKey key: UserDefaultsKey) {
        let data = try? JSONEncoder().encode(value)
        standard.setValue(data, forKey: key.rawValue)
    }
    
    /// Get codable object from UserDefaults.
    /// Ex: let value: Structure? = UserDefaults.standard.codable(forKey: "key")
    /// Where "Structure" is conforming to codable protocol
    /// We need to spicify the type becase while working with codable we are supposed to deal with different types.
    func get<Element: Codable>(forKey key: UserDefaultsKey) -> Element? {
        guard let data = standard.data(forKey: key.rawValue) else { return nil }
        let element = try? JSONDecoder().decode(Element.self, from: data)
        return element
    }
    
    /// Get a value from UserDefaults.
    func get(for key: UserDefaultsKey) -> String? {
        return standard.value(forKey: key.rawValue) as? String
    }
    
    /// Remove a value from UserDefaults at an exact key.
    func clearUserData(at key: UserDefaultsKey) {
        standard.removeObject(forKey: key.rawValue)
    }
}

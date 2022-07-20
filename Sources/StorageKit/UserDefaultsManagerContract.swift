//
//  UserDefaultsManagerContract.swift
//  MakeenFull
//
//  Created by Ahmed Ashraf on 26/05/2022.
//  Copyright © 2022 Alqemam. All rights reserved.
//

import Foundation

protocol UserDefaultsManagerContract {
    func save(_ value: String, key: UserDefaultsKey)
    
    /// Save codable object to UserDefaults.
    func save<Element: Codable>(value: Element, forKey key: UserDefaultsKey)
    
    /// Get codable object from UserDefaults.
    /// Ex: let value: Structure? = UserDefaults.standard.codable(forKey: "key")
    /// Where "Structure" is conforming to codable protocol
    /// We need to spicify the type becase while working with codable we are supposed to deal with different types.
    func get<Element: Codable>(forKey key: UserDefaultsKey) -> Element?
    
    /// Get a value from UserDefaults.
    func get(for key: UserDefaultsKey) -> String?
    
    /// Remove a value from UserDefaults at an exact key.
    func clearUserData(at key: UserDefaultsKey)
}

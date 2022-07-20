//
//  KeychainManager.swift
//  MakeenFull
//
//  Created by Mahmoud Aziz on 19/05/2022.
//

import Foundation
import KeychainAccess

class KeychainManager: KeychainManagerContract {
    private let keychain = Keychain(service: EnvironmentManager.shared.bundleID)
    
    static let shared = KeychainManager()
    
    /// Save value to the Keychain of the device.
    /// Use this helper to save sensitive data, for ex: user token and credentials.
    func save(_ value: String, key: KeychainKey) {
        do {
            try keychain.set(value, key: key.rawValue)
        } catch let error {
            print("Error saving data to keychain: \(error)", logLevel: .error)
        }
    }
    
    /// Get a value from Keychain.
    func get(for key: KeychainKey) -> String? {
        do {
            return try keychain.get(key.rawValue)
        } catch let error {
            print("Error getting data to keychain: \(error)", logLevel: .error)
            return nil
        }
    }
    
    /// Remove a value from Keychain.
    func remove(at key: KeychainKey) {
        do {
            try keychain.remove(key.rawValue)
        } catch let error {
            print("Error remove data from keychain: \(error)", logLevel: .error)
        }
    }
}

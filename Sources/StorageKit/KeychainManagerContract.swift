//
//  KeychainManagerContract.swift
//  MakeenFull
//
//  Created by Ahmed Ashraf on 26/05/2022.
//  Copyright © 2022 Alqemam. All rights reserved.
//

import Foundation

protocol KeychainManagerContract {
    func save(_ value: String, key: KeychainKey)
    
    /// Get a value from Keychain.
    func get(for key: KeychainKey) -> String?
    
    /// Remove a value from Keychain.
    func remove(at key: KeychainKey)
}

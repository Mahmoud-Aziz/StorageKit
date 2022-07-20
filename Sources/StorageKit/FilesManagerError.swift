//
//  FilesManagerError.swift
//  MakeenFull
//
//  Created by Mahmoud Aziz on 19/05/2022.
//

import Foundation

enum FilesManagerError: Swift.Error {
    case fileAlreadyExists
    case invalidDirectory
    case writtingFailed
    case fileNotExists
    case readingFailed
}

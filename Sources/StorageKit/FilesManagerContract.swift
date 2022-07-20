//
//  FilesManagerContract.swift
//  MakeenFull
//
//  Created by Ahmed Ashraf on 26/05/2022.
//  Copyright © 2022 Alqemam. All rights reserved.
//

import Foundation

protocol FilesManagerContract: WriteFilesManagerContract, ReadFilesManagerContract, CheckFileExistenceContract {
}

protocol WriteFilesManagerContract {
    func write(_ data: Data?, in fileName: String, with fileExtension: FileExtension)
    func write(_ data: Data?, _ fileName: String, with fileExtension: FileExtension) -> URL?
}

protocol ReadFilesManagerContract {
    func read(file fileName: String, with extention: FileExtension) -> Data?
    func read(file fileName: String, with extention: String) -> Data?
}

protocol CheckFileExistenceContract {
    func isFileExist(file fileName: String, with extention: FileExtension) -> Bool
}

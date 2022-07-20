//
//  FilesManager.swift
//  MakeenFull
//
//  Created by Mahmoud Aziz on 19/05/2022.
//

import Foundation

class FilesManager: FilesManagerContract {
    
    static let shared = FilesManager()
    private let fileManager: FileManager
    private var userCacheURL: URL?
    private let userCacheQueue = OperationQueue()
    private let baseDirectory: URL
    
    init(fileManager: FileManager = .default) {
        self.fileManager = fileManager
        guard let baseDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
            fatalError("Can't Get documentDirectory ")
        }
        self.baseDirectory = baseDirectory
    }
    /// write data to the device's local storage.
    func write(_ data: Data?, in fileName: String, with fileExtension: FileExtension) {
        write(data, in: fileName, with: fileExtension.rawValue)
    }
    
    /// Save video in opening screen and return the path
    func write(_ data: Data?, _ fileName: String, with fileExtension: FileExtension) -> URL? {
        return write(data, fileName, with: fileExtension.rawValue)
    }
    
    private func write(_ data: Data?, _ fileName: String, with fileExtension: String) -> URL? {
        guard let data = data else {
            logWarning(.errorGettingDataToWriteToFile)
            return nil
        }
        var pathURL = baseDirectory
        pathURL = pathURL.appendingPathComponent(fileName)
        pathURL = pathURL.appendingPathExtension(fileExtension)
        do {
            try data.write(to: pathURL)
            return pathURL
        } catch {
            print("Error saving to FilesManager, Error: \(error.localizedDescription)", logLevel: .error)
        }
        return nil
    }
    
    /// write data to the device's local storage.
    private func write(_ data: Data?, in fileName: String, with fileExtension: String) {
        guard let data = data else { return }
        var fileURL = baseDirectory.appendingPathComponent(fileName)
        fileURL.appendPathExtension(fileExtension)
        do {
            try data.write(to: fileURL)
        } catch {
            print("Error saving to FilesManager, Error: \(error.localizedDescription)", logLevel: .error)
        }
    }
    
    /// Read data previously saved to the device's local storage.
    func read(file fileName: String, with extention: FileExtension) -> Data? {
        read(file: fileName, with: extention.rawValue)
    }
    /// Read data previously saved to the device's local storage.
    func read(file fileName: String, with extention: String) -> Data? {
        let fileURL = baseDirectory
            .appendingPathComponent(fileName)
            .appendingPathExtension(extention)
        do {
            let data = try Data(contentsOf: fileURL)
            return data
        } catch {
            print("Error reading data from FilesManager, Error: \(error.localizedDescription)", logLevel: .error)
            return nil
        }
    }
    
    func isFileExist(file fileName: String, with extention: FileExtension) -> Bool {
        let url = baseDirectory
            .appendingPathComponent(fileName)
            .appendingPathExtension(extention.rawValue)
        let path = url.path
        return fileManager.fileExists(atPath: path)
    }
}

//
//  FileDescriptor.swift
//  Shared
//
//  Created by Andrew McKnight on 5/4/21.
//

import Foundation
import SwiftIO

public extension FileDescriptor {

    enum FileError: Error {
        case failedReadingFile
        case failedReadingString
        case failedReadingNumber
    }

    // read string from file and print to LCD
     func getString() throws -> String {
         let file = FileDescriptor.open("/SD:/string.txt")
         let buffer = UnsafeMutableRawBufferPointer.allocate(byteCount: 10, alignment: 4)
         guard file.read(into: buffer) == 0 else {
            throw FileError.failedReadingFile
         }
         let asciiHexCodesToDigits: [UInt8: String] = [0x30: "0", 0x31: "1", 0x32: "2", 0x33: "3", 0x34: "4", 0x35: "5", 0x36: "6", 0x37: "7", 0x38: "8", 0x39: "9"]
         var result = String()
         for i in 0..<buffer.count {
             guard let placeValue: String = asciiHexCodesToDigits[buffer[i]] else {
                throw FileError.failedReadingString
             }
             result.append(placeValue)
         }
         return result
     }

     func pow(_ base: Int, _ power: Int) -> Int {
         var result = base
         for _ in 0..<power {
             result *= base
         }
         return result
     }

    // // read number from file and print to LCD
     func getNumber() throws -> UInt32 {
        let file = FileDescriptor.open("/SD:/number.txt")
         let buffer = UnsafeMutableRawBufferPointer.allocate(byteCount: 10, alignment: 4)
         guard file.read(into: buffer) == 0 else {
            throw FileError.failedReadingFile
         }
         let asciiHexCodesToDigits: [UInt8: UInt8] = [0x30: 0, 0x31: 1, 0x32: 2, 0x33: 3, 0x34: 4, 0x35: 5, 0x36: 6, 0x37: 7, 0x38: 8, 0x39: 9]
         var result: UInt32 = 0
         var power = buffer.count - 1
         for i in 0..<buffer.count {
             guard let byteValue = asciiHexCodesToDigits[buffer[i]] else {
                throw FileError.failedReadingNumber
             }
             result += UInt32(byteValue) * UInt32(pow(10, power))
             power -= 1
         }
         return result
     }
}

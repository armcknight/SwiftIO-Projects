//
//  Float.swift
//  Shared
//
//  Created by Andrew McKnight on 5/3/21.
//

import Foundation

public extension Float {
    /// Get a number with one decimal place. `String(format:)` is not available to build for SwiftIO.
    func format(_ f: Int) -> Float {
        guard f > 0 else {return self}
        var mul = 10
        for _ in 1..<f {
            mul *= 10
        }
        let data = Int(self * Float(mul))
        return Float(data) / Float(mul)
    }
}

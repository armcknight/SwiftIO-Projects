//
//  CaseIterable.swift
//  Shared
//
//  Created by Andrew McKnight on 3/19/21.
//

import Foundation

var currentIteratingIdx = 0

public extension CaseIterable {
    /// Iterating through the cases in an infinite loop based on `allCases`, take the next case.
    /// - Returns: The next case in the iteration.
    static func next() -> Self {
        let `case` = allCases[allCases.index(allCases.startIndex, offsetBy: currentIteratingIdx)]
        currentIteratingIdx = (currentIteratingIdx + 1) % allCases.count
        return `case`
    }
}

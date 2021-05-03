//
//  ThenConformance.swift
//  Shared
//
//  Created by Andrew McKnight on 3/19/21.
//

/*
 This file exists to conform types to `Then`. That project declares some
 conformances to common types like `CGPoint` and `Array`, but for any other
 types, list them here and any target that consumes this shared library will be
 able to use them.
 */

import Then

extension Int: Then {}
extension Float: Then {}

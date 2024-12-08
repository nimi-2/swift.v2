
//
//  Extension.swift
//  MemoryGame
//
//  Created by student on 06/12/2024.
//

import Foundation
import SwiftUI
extension Animation{
    static func spin(duration: TimeInterval) -> Animation{
        return .linear(duration: duration).repeatForever(autoreverses: false)
    }
}



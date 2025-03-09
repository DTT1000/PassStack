//
//  Pass.swift
//  PassStack
//
//  Created by Dominic Thompson on 3/8/25.
//

import SwiftUI

/// A data model representing a pass used in `PassStack`.
///
/// The `Pass` struct contains basic properties defining a pass, including location, type, and color.
/// This struct can be extended to include additional fields as needed to support various use cases.
///
/// - Note: Conforms to `Identifiable`, `Hashable`, and `Sendable` to allow easy integration with SwiftUI and state management.
struct Pass: Identifiable, Hashable, Sendable {
    let id = UUID()
    var location: String
    var type: String
    var color: Color
}

/// An extension providing sample data for demonstration and testing purposes.
///
/// - Note: The colors are initialized using a custom `Color(hex:)` initializer.
extension Pass {
    static let passes: [Pass] = [
        Pass(location: "Location #1", type: "Line Pass", color: Color(hex: "111E37")),
        Pass(location: "Location #2", type: "Skip Pass", color: Color(hex: "371111")),
        Pass(location: "Location #3", type: "Line Pass", color: Color(hex: "111E37")),
        Pass(location: "Location #4", type: "Skip Pass", color: Color(hex: "371111")),
        Pass(location: "Location #5", type: "Line Pass", color: Color(hex: "111E37")),
        Pass(location: "Location #6", type: "Skip Pass", color: Color(hex: "371111"))
    ]
}

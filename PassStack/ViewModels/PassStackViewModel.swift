//
//  PassStackViewModel.swift
//  PassStack
//
//  Created by Dominic Thompson on 7/26/24.
//

import SwiftUI

/// A view model responsible for managing and displaying a stack of passes in ``PassStackView``.
///
/// `PassStackViewModel` provides logic for handling pass selection, visibility, positioning,
/// scaling, and effects such as blur and opacity. It enables smooth transitions between passes
/// and maintains the correct index references for animations and interactions.
///
/// - Note: This class is intended to be used with a SwiftUI view that visualizes a stack of passes.
class PassStackViewModel: ObservableObject {
    var passes: [Pass] = Pass.passes

    /// Retrieves the index of a given pass within the pass stack.
    ///
    /// - Parameter pass: The `Pass` instance to find in the stack.
    /// - Returns: The index of the pass if found, otherwise `0`.
    func getPassIndex(for pass: Pass) -> Int {
        return passes.firstIndex(of: pass) ?? 0
    }

    /// Computes the selected pass index as a `CGFloat`, primarily for animation calculations.
    ///
    /// - Parameter selectedPass: The currently selected `Pass`, or `nil` if no pass is selected.
    /// - Returns: The index of the selected pass as a `CGFloat`, or `0` if none is selected.
    func selectedIndex(selectedPass: Pass?) -> CGFloat {
        guard let selected = selectedPass else { return 0 }
        return CGFloat(getPassIndex(for: selected))
    }

    /// Determines the opacity for a given pass based on its position in relation to the selected pass.
    ///
    /// - Parameters:
    ///   - pass: The `Pass` to determine opacity for.
    ///   - index: The index of the pass in the stack.
    ///   - selectedPass: The currently selected `Pass`, or `nil` if no pass is selected.
    /// - Returns: `1` if the pass is visible, `0` if it should be hidden.
    func opacity(for pass: Pass, at index: CGFloat, selectedPass: Pass?) -> Double {
        guard let selectedPass = selectedPass else { return 1 }
        return selectedPass == pass || selectedIndex(selectedPass: selectedPass) > index ? 1 : 0
    }

    /// Calculates the offset for a given pass in the stack.
    ///
    /// - Parameters:
    ///   - pass: The `Pass` to determine offset for.
    ///   - index: The index of the pass in the stack.
    ///   - selectedPass: The currently selected `Pass`, or `nil` if no pass is selected.
    /// - Returns: A `CGFloat` representing the pass’s horizontal offset.
    func offset(for pass: Pass, at index: CGFloat, selectedPass: Pass?) -> CGFloat {
        guard let selectedPass = selectedPass else { return index * 50 }
        return selectedPass == pass || selectedIndex(selectedPass: selectedPass) > index ? 0 : 700
    }

    /// Computes the scale factor for a given pass in the stack based on its position.
    ///
    /// - Parameters:
    ///   - pass: The `Pass` to determine scale for.
    ///   - index: The index of the pass in the stack.
    ///   - displayScale: The scaling factor applied when passes are in transition.
    ///   - selectedPass: The currently selected `Pass`, or `nil` if no pass is selected.
    /// - Returns: A `CGFloat` representing the scale factor.
    func scale(for pass: Pass, at index: CGFloat, displayScale: CGFloat, selectedPass: Pass?) -> CGFloat {
        guard selectedPass != nil else { return 1 }
        return selectedIndex(selectedPass: selectedPass) > index ? 1 - displayScale : 1
    }

    /// Determines the blur radius for a given pass in relation to the selected pass.
    ///
    /// - Parameters:
    ///   - pass: The `Pass` to determine blur for.
    ///   - index: The index of the pass in the stack.
    ///   - selectedPass: The currently selected `Pass`, or `nil` if no pass is selected.
    /// - Returns: A `CGFloat` representing the blur radius.
    func blurRadius(for pass: Pass, at index: CGFloat, selectedPass: Pass?) -> CGFloat {
        guard let selectedPass = selectedPass, selectedPass != pass, selectedIndex(selectedPass: selectedPass) <= index else { return 0 }
        return 10
    }
}

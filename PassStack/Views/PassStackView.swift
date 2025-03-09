//
//  PassStackView.swift
//  PassStack
//
//  Created by Dominic Thompson on 3/8/25.
//

import SwiftUI

/// A SwiftUI view responsible for managing and animating a stack of passes.
///
/// `PassStackView` displays a stack of passes, handling animations for selection, opacity, offset,
/// scaling, and blur effects. When a pass is tapped, it smoothly transitions into view, and tapping again
/// deselects it.
///
/// - The `viewModel` manages pass data and provides values for animations.
/// - The `selectedPass` binding determines which pass is currently active.
struct PassStackView: View {
    @StateObject private var viewModel = PassStackViewModel()
    @Binding var selectedPass: Pass?
    @Namespace private var passSpace

    var body: some View {
        ZStack {
            ForEach(viewModel.passes) { pass in
                let index = CGFloat(viewModel.getPassIndex(for: pass))
                let reversedIndex = CGFloat(viewModel.passes.count - 1) - index
                let displayScale = (reversedIndex / CGFloat(viewModel.passes.count)) * 0.15

                PassView(pass: pass)
                    .matchedGeometryEffect(id: pass, in: passSpace)
                    .opacity(viewModel.opacity(for: pass, at: index, selectedPass: selectedPass))
                    .offset(y: viewModel.offset(for: pass, at: index, selectedPass: selectedPass))
                    .scaleEffect(viewModel.scale(for: pass, at: index, displayScale: displayScale, selectedPass: selectedPass))
                    .blur(radius: viewModel.blurRadius(for: pass, at: index, selectedPass: selectedPass))
                    .onTapGesture {
                        withAnimation(.bouncy) {
                            selectedPass = selectedPass == pass ? nil : pass
                        }
                    }
                    .zIndex(index)
            }
        }
        .padding(.bottom, CGFloat(50 * (viewModel.passes.count - 1)))
    }
}

#Preview {
    PassStackView(selectedPass: .constant(nil))
}

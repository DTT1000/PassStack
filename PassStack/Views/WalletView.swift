//
//  WalletView.swift
//  PassStack
//
//  Created by Dominic Thompson on 3/8/25.
//

import SwiftUI

/// A SwiftUI view that provides an example implementation of handling and visualizing a pass stack.
///
/// `WalletView` displays a collection of passes using `PassStackView`. When a pass is selected,
/// additional details about the pass are shown with a smooth transition effect. Users can tap
/// the "Done" button or tap the pass itself to return to the main wallet view.
///
/// - The main interface consists of a title, a divider, and a dynamic pass stack.
/// - When a pass is selected, its details appear with an animated transition.
///
/// - Note: This view demonstrates how to integrate `PassStackView` into an interactive user interface.
struct WalletView: View {
    @State private var selectedPass: Pass?

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                if selectedPass == nil {
                    Group {
                        Text("Wallet")
                            .font(.title)
                            .fontWeight(.bold)
                            .padding(.horizontal)
                            .padding(.bottom, 10)
                            .frame(maxWidth: .infinity, alignment: .leading)

                        Divider()
                    }
                    .transition(.blurReplace)
                } else {
                    Button(action: {
                        withAnimation(.bouncy) {
                            selectedPass = nil
                        }
                    }) {
                        Text("Done")
                            .padding(.horizontal)
                            .padding(.bottom, 10)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .transition(.blurReplace)
                }

                ScrollView {
                    VStack(spacing: 0) {
                        ZStack(alignment: .topLeading) {
                            PassStackView(selectedPass: $selectedPass)
                                .padding(.horizontal)
                                .zIndex(1)

                            VStack(alignment: .leading) {
                                if let pass = selectedPass {
                                    Text(pass.type)
                                        .font(.title2)
                                        .fontWeight(.bold)
                                        .transition(.opacity.combined(with: .blurReplace))

                                    Text(pass.location)
                                        .foregroundStyle(.gray)
                                        .transition(.opacity.combined(with: .blurReplace))

                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(.gray)
                                        .frame(height: 300)
                                        .transition(.opacity.combined(with: .blurReplace))
                                }
                            }
                            .zIndex(0)
                            .padding(.top, 220)
                            .padding(.horizontal)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .animation(selectedPass != nil ? .easeInOut.delay(0.1) : .easeInOut(duration: 0.2), value: selectedPass)
                        }
                    }
                    .padding(.top, 10)
                }
            }
        }
    }
}

#Preview {
    WalletView()
}

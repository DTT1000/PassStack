//
//  Ticket.swift
//  PassStack
//
//  Created by Dominic Thompson on 3/8/25.
//

import SwiftUI

/// A custom shape representing a ticket with a rounded rectangle body and circular cutouts.
///
/// The `Ticket` shape consists of a rounded rectangle with two circular cutouts—one at the top and one at the bottom.
/// This can be used in UI elements such as event passes, tickets, or vouchers in SwiftUI.
///
/// - Note: This shape can be applied with `.fill()` or `.stroke()` modifiers to style its appearance.
struct Ticket: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let radius: CGFloat = 10
        let circleRadius: CGFloat = 14

        // Rounded rectangle path
        let roundedRect = Path(roundedRect: rect, cornerRadius: radius)
        path.addPath(roundedRect)

        // Create a path for the circles
        var circlesPath = Path()

        // Top circle cutout
        let topCircle = CGRect(
            x: (rect.midX - circleRadius),
            y: -circleRadius,
            width: circleRadius * 2,
            height: circleRadius * 2
        ).offsetBy(dx: 0, dy: 0)

        // Bottom circle cutout
        let bottomCircle = CGRect(
            x: (rect.midX - circleRadius),
            y: rect.height - circleRadius,
            width: circleRadius * 2,
            height: circleRadius * 2
        ).offsetBy(dx: 0, dy: 0)

        circlesPath.addEllipse(in: topCircle)
        circlesPath.addEllipse(in: bottomCircle)

        // Subtract the circles from the rounded rectangle
        path.addPath(circlesPath, transform: .identity)
        return path
            .subtracting(circlesPath)
    }
}

#Preview {
    Ticket()
}

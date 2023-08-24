//
//  SwiftUIView.swift
//
//
//  Created by Gaetano Celentano on 24/08/23.
//

import SwiftUI

/// Chevron Rotation Icon
/// **parameters list**:
/// - **isSelected**: state handle
/// - **size**: icon size
/// - **duration**: animation duration
/// - **from**: starting rotation of the chevron
/// - **to**: ending rotation of the chevron

@available(iOS 13.0, *)
@available(macOS 10.15, *)
public enum ChevronDirections: CGFloat {
    case top = 0.0
    case left = 90.0
    case right = -90.0
    case bottom = 180.0
}

public enum ChevronLineCaps: Int32 {
    case rounded = 1
    case pointy = 0
    case squared = 2
}

@available(iOS 13.0, *)
@available(macOS 10.15, *)
public struct ChevronRotation: View {
    public init(isSelected: Binding<Bool>, size: CGFloat = 24.0, duration: CGFloat = 0.2, from: ChevronDirections, to: ChevronDirections, lineCaps: ChevronLineCaps = .rounded, chevronColor: Color = .black) {
        _isSelected = isSelected
        self.size = size
        self.duration = duration
        self.from = from
        self.to = to
        self.lineCaps = lineCaps
        self.chevronColor = chevronColor
    }

    @Binding private var isSelected: Bool
    @State private var size: CGFloat
    @State private var duration: CGFloat
    @State private var from: ChevronDirections
    @State private var to: ChevronDirections
    @State private var lineCaps: ChevronLineCaps
    @State private var chevronColor: Color

    public var body: some View {
        ZStack {
            CustomChevron()
                .stroke(chevronColor, style: StrokeStyle(lineWidth: size * 0.15, lineJoin: CGLineJoin(rawValue: lineCaps.rawValue) ?? .round))
        }
        .frame(width: size, height: size)
        .rotationEffect(isSelected ? .degrees(to.rawValue) : .degrees(from.rawValue))
        .onTapGesture {
            withAnimation(.linear(duration: duration)) {
                isSelected.toggle()
            }
        }
    }
}

@available(iOS 13.0, *)
@available(macOS 10.15, *)
struct ChevronRotation_Previews: PreviewProvider {
    static var previews: some View {
        ChevronRotation(isSelected: .constant(false), size: 200, from: .top, to: .right)
    }
}

@available(iOS 13.0, *)
@available(macOS 10.15, *)
private struct CustomChevron: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.midX, y: 0))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.midX, y: 0))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            path.closeSubpath()
        }
    }
}

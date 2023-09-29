//
//  SwiftUIView.swift
//
//
//  Created by Gaetano Celentano on 29/09/23.
//

import SwiftUI

/// **AudioControl**
///
/// - **size**: icon size
/// - **color**: icon color
/// - **duration**: animation duration
/// - **isNextButton**: flag indicating the direction of the button

@available(iOS 13.0, *)
@available(macOS 10.15, *)
public struct AudioControl: View {
    public init(size: CGFloat = 24.0, duration: CGFloat = 0.35, color: Color = .black, isNextButton: Bool = true) {
        self.size = size
        self.color = color
        self.isNextButton = isNextButton
        self.duration = duration
        self.sizes = isNextButton ? [0.0, 0.45, 0.45] : [0.45, 0.45, 0.0]
    }

    @State private var size: CGFloat
    @State private var color: Color
    @State private var isNextButton: Bool
    @State private var duration: CGFloat

    @State private var sizes: [CGFloat]

    public var body: some View {
        HStack {
            AudioControlPieceShape()
                .frame(width: size * sizes[0], height: size * sizes[0])
                .rotationEffect(.degrees(isNextButton ? 0.0 : 180.0))
            AudioControlPieceShape()
                .frame(width: size * sizes[1], height: size * sizes[1])
                .rotationEffect(.degrees(isNextButton ? 0.0 : 180.0))
            AudioControlPieceShape()
                .frame(width: size * sizes[2], height: size * sizes[2])
                .rotationEffect(.degrees(isNextButton ? 0.0 : 180.0))
        }
        .frame(width: size, height: size, alignment: isNextButton ? .trailing : .leading)
        .foregroundColor(color)
        .onTapGesture {
            withAnimation(.linear(duration: duration)) {
                sizes[2] = isNextButton ? 0.0 : 0.45
                sizes[0] = isNextButton ? 0.45 : 0.0
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
                sizes[2] = isNextButton ? 0.45 : 0.0
                sizes[0] = isNextButton ? 0.0 : 0.45
            }
        }
    }
}

@available(iOS 13.0, *)
@available(macOS 10.15, *)
private struct AudioControlPieceShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(to: .zero)
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.closeSubpath()

        return path
    }
}

@available(iOS 13.0, *)
@available(macOS 10.15, *)
struct AudioControl_Previews: PreviewProvider {
    static var previews: some View {
        AudioControl(size: 200)
    }
}

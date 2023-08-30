//
//  SwiftUIView.swift
//
//
//  Created by Gaetano Celentano on 28/08/23.
//

import SwiftUI

/// BouncyLoadingDots
/// **Parameters List**:
/// - **size**: icon size
/// - **color**: icon color
/// - **dotsShape**: shape of the dots, currently supported
///     - circle
///     - rectangle
///     - roundedRectangle
///     - triangle
///     - star

@available(iOS 13.0, *)
@available(macOS 10.15, *)
public struct BouncyDots: View {
    public init(size: CGFloat = 48.0, color: Color = .black, dotsShape: DotShape = .circle) {
        self.size = size
        self.color = color
        self.dotsShape = dotsShape
    }

    @State private var size: CGFloat
    @State private var color: Color
    @State private var dotsShape: DotShape

    @State private var yOffsets = [0.0, 0.0, 0.0]

    public var body: some View {
        ZStack {
            let dotSize = dotsShape == .star ? size * 0.3 : size * 0.2

            Rectangle()
                .frame(width: dotSize, height: dotSize)
                .clipShape(ActualDotShape(shapeToDraw: dotsShape))
                .offset(x: -size * 0.3, y: yOffsets[0])
                .animation(.linear.repeatCount(1, autoreverses: true).delay(0.3).repeatForever(), value: yOffsets[0])
            Rectangle()
                .frame(width: dotSize, height: dotSize)
                .clipShape(ActualDotShape(shapeToDraw: dotsShape))
                .offset(x: 0, y: yOffsets[1])
                .animation(.linear.repeatCount(1, autoreverses: true).delay(0.3).repeatForever().delay(0.15), value: yOffsets[1])
            Rectangle()
                .frame(width: dotSize, height: dotSize)
                .clipShape(ActualDotShape(shapeToDraw: dotsShape))
                .offset(x: size * 0.3, y: yOffsets[2])
                .animation(.linear.repeatCount(1, autoreverses: true).delay(0.3).repeatForever().delay(0.3), value: yOffsets[2])
        }
        .frame(width: size, height: size)
        .foregroundColor(color)
        .onAppear {
            yOffsets[0] = -size * 0.25
            yOffsets[1] = -size * 0.25
            yOffsets[2] = -size * 0.25
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                yOffsets[0] = 0.0
                yOffsets[1] = 0.0
                yOffsets[2] = 0.0
            }
        }
    }
}

@available(iOS 13.0, *)
@available(macOS 10.15, *)
struct BouncyLoadingDots_Previews: PreviewProvider {
    static var previews: some View {
        BouncyDots(dotsShape: .star)
    }
}

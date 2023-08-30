//
//  SwiftUIView.swift
//
//
//  Created by Gaetano Celentano on 30/08/23.
//

import SwiftUI

/// GrowingLoadingDots
/// Parameters list:
/// - **size**: icon size
/// - **color**: icon color
/// - **dotsShape**: shape of the dots, currently supported
///     - circle
///     - rectangle
///     - roundedRectangle
///     - triangle
///     - star
///  - **fromLeftToRight**: if the animation goes from left to right, or just outside dots in sync and then inside
///  - **duration**: animation duration

@available(iOS 13.0, *)
@available(macOS 10.15, *)
public struct GrowingLoadingDots: View {
    public init(size: CGFloat = 48.0, color: Color = .black, dotsShape: DotShape = .circle, fromLeftToRight: Bool = true, duration: CGFloat = 0.35) {
        self.size = size
        self.color = color
        self.dotsShape = dotsShape
        self.fromLeftToRight = fromLeftToRight
        self.duration = duration
    }

    @State private var size: CGFloat
    @State private var color: Color
    @State private var dotsShape: DotShape
    @State private var fromLeftToRight: Bool
    @State private var duration: CGFloat

    @State private var animatedScales = [1.0, 1.0, 1.0]

    public var body: some View {
        ZStack {
            let dotSize = dotsShape == .star ? size * 0.3 : size * 0.2
            Rectangle()
                .frame(width: dotSize, height: dotSize)
                .clipShape(ActualDotShape(shapeToDraw: dotsShape))
                .scaleEffect(animatedScales[0], anchor: .center)
                .animation(.linear(duration: duration).repeatForever().delay(fromLeftToRight ? 0.0 : 0.4), value: animatedScales[0])
                .offset(x: -size * 0.3, y: 0)
            Rectangle()
                .frame(width: dotSize, height: dotSize)
                .clipShape(ActualDotShape(shapeToDraw: dotsShape))
                .scaleEffect(animatedScales[1], anchor: .center)
                .animation(.linear(duration: duration).repeatForever().delay(fromLeftToRight ? 0.15 : 0.0), value: animatedScales[1])
            Rectangle()
                .frame(width: dotSize, height: dotSize)
                .clipShape(ActualDotShape(shapeToDraw: dotsShape))
                .scaleEffect(animatedScales[2], anchor: .center)
                .animation(.linear(duration: duration).repeatForever().delay(fromLeftToRight ? 0.3 : 0.4), value: animatedScales[2])
                .offset(x: size * 0.3, y: 0)
        }
        .frame(width: size, height: size)
        .onAppear {
            for i in 0 ..< animatedScales.count {
                animatedScales[i] = 0.0
            }
        }
    }
}

@available(iOS 13.0, *)
@available(macOS 10.15, *)
struct GrowingLoadingDots_Previews: PreviewProvider {
    static var previews: some View {
        GrowingLoadingDots(dotsShape: .triangle, fromLeftToRight: false)
    }
}

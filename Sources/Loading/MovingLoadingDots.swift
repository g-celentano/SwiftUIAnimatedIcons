//
//  SwiftUIView.swift
//
//
//  Created by Gaetano Celentano on 29/08/23.
//

import SwiftUI

/// DisappearingLoadingDots
/// Parameters list:
/// - **size**: icon size
/// - **color**: icon color
/// - **dotsShape**: shape of the dots, currently supported
///     - circle
///     - rectangle
///     - roundedRectangle
///     - triangle
///     - star
/// - **animationDuration**: duration in **seconds** of a single animation iteration
/// - **animationDelay**: delay in **seconds** between animation completions

@available(iOS 13.0, *)
@available(macOS 10.15, *)
public struct MovingLoadingDots: View {
    public init(size: CGFloat = 48, color: Color = .black, dotsShape: DotShape = .circle, animationDuration: CGFloat = 0.2, animationDelay: CGFloat = 0.2) {
        self.size = size
        self.color = color
        self.dotsShape = dotsShape
        self.animationDuration = animationDuration
        self.animationDelay = animationDelay
    }

    @State private var size: CGFloat
    @State private var color: Color
    @State private var dotsShape: DotShape
    @State private var animationDuration: CGFloat
    @State private var animationDelay: CGFloat

    @State private var movingAmount: CGFloat = 0.0
    @State private var scale: CGFloat = 1.0

    public var body: some View {
        ZStack {
            let dotSize = dotsShape == .star ? size * 0.3 : size * 0.2
            let disappearingPoint: UnitPoint = dotsShape == .star || dotsShape == .triangle ? .bottomLeading : .leading
            let appearingPoint: UnitPoint = dotsShape == .star || dotsShape == .triangle ? .bottomTrailing : .trailing

            Rectangle()
                .frame(width: dotSize, height: dotSize)
                .clipShape(ActualDotShape(shapeToDraw: dotsShape))
                .scaleEffect(1 - scale, anchor: appearingPoint)
                .offset(x: (-size * 0.6) + movingAmount, y: 0)
                .animation(.linear(duration: animationDuration).delay(animationDelay).repeatForever(autoreverses: false), value: movingAmount)
                .animation(.linear(duration: animationDuration).repeatForever(autoreverses: false), value: scale)
            Rectangle()
                .frame(width: dotSize, height: dotSize)
                .clipShape(ActualDotShape(shapeToDraw: dotsShape))
                .offset(x: (-size * 0.3) + movingAmount, y: 0)
                .animation(.linear(duration: animationDuration).delay(animationDelay).repeatForever(autoreverses: false), value: movingAmount)
            Rectangle()
                .frame(width: dotSize, height: dotSize)
                .clipShape(ActualDotShape(shapeToDraw: dotsShape))
                .offset(x: movingAmount, y: 0)
                .animation(.linear(duration: animationDuration).delay(animationDelay).repeatForever(autoreverses: false), value: movingAmount)
            Rectangle()
                .frame(width: dotSize, height: dotSize)
                .clipShape(ActualDotShape(shapeToDraw: dotsShape))
                .scaleEffect(scale, anchor: disappearingPoint)
                .offset(x: size * 0.3 + movingAmount, y: 0)
                .animation(.linear(duration: animationDuration).delay(animationDelay).repeatForever(autoreverses: false), value: movingAmount)
                .animation(.linear(duration: animationDuration).repeatForever(autoreverses: false), value: scale)
        }
        .frame(width: size, height: size)
        .foregroundColor(color)
        .onAppear {
            movingAmount = size * 0.3
            scale = 0.1
        }
    }
}

@available(iOS 13.0, *)
@available(macOS 10.15, *)
struct MovingLoadingDots_Previews: PreviewProvider {
    static var previews: some View {
        MovingLoadingDots(dotsShape: .circle, animationDuration: 1.2, animationDelay: 0.1)
    }
}

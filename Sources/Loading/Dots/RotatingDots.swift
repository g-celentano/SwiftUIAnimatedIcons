//
//  SwiftUIView.swift
//
//
//  Created by Gaetano Celentano on 30/08/23.
//

import SwiftUI

/// RotatingLoadingDots
/// Parameters List
/// - **size**: icon size
/// - **color**: icon color
/// - **dotsShape**: dots shape, currently supported
///     - circle
///     - rectangle
///     - roundedRectangle
///     - triangle
///     - star
/// - **animationDuration**: duration in **seconds** of a single rotation
/// - **animationDelay**: delay in **seconds** between rotations completions

@available(iOS 13.0, *)
@available(iOS 10.15, *)
public struct RotatingDots: View {
    public init(size: CGFloat = 48.0, color: Color = .black, dotsShape: DotShape = .circle, animationDuration: CGFloat = 0.35, animationDelay: CGFloat = 0.15) {
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

    @State private var currentRotationDegree: Angle = .degrees(0)

    public var body: some View {
        ZStack {
            let dotSize = dotsShape == .star ? size * 0.3 : size * 0.2

            Rectangle()
                .frame(width: dotSize, height: dotSize)
                .clipShape(ActualDotShape(shapeToDraw: dotsShape))
                .offset(x: -size * 0.3, y: 0)
                .rotationEffect(currentRotationDegree)
                .animation(.easeIn(duration: animationDuration).delay(animationDelay).repeatForever(autoreverses: false), value: currentRotationDegree)
            Rectangle()
                .frame(width: dotSize, height: dotSize)
                .clipShape(ActualDotShape(shapeToDraw: dotsShape))
            Rectangle()
                .frame(width: dotSize, height: dotSize)
                .clipShape(ActualDotShape(shapeToDraw: dotsShape))
                .offset(x: size * 0.3, y: 0)
                .rotationEffect(currentRotationDegree)
                .animation(.easeIn(duration: animationDuration).delay(animationDelay).repeatForever(autoreverses: false), value: currentRotationDegree)
        }
        .frame(width: size, height: size)
        .foregroundColor(color)
        .onAppear{
            currentRotationDegree = .degrees(180)
        }
    }
}

@available(iOS 13.0, *)
@available(iOS 10.15, *)
struct RotatingLoadingDots_Previews: PreviewProvider {
    static var previews: some View {
        RotatingDots(animationDelay: 0)
    }
}

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

@available(iOS 13.0, *)
@available(macOS 10.15, *)
public struct DisappearingLoadingDots: View {
    public init(size: CGFloat = 48, color: Color = .black, dotsShape: DotShape = .circle) {
        self.size = size
        self.color = color
        self.dotsShape = dotsShape
    }

    @State private var size: CGFloat
    @State private var color: Color
    @State private var dotsShape: DotShape

    @State private var opacities = [1.0, 1.0, 1.0]

    public var body: some View {
        ZStack {
            let dotSize = dotsShape == .star ? size * 0.3 : size * 0.2
            
            Rectangle()
                .frame(width: dotSize, height: dotSize)
                .clipShape(ActualDotShape(shapeToDraw: dotsShape))
                .offset(x: -size * 0.3, y: 0)
                .opacity(opacities[0])
                .animation(.linear.repeatForever(), value: opacities[0])
            Rectangle()
                .frame(width: dotSize, height: dotSize)
                .clipShape(ActualDotShape(shapeToDraw: dotsShape))
                .opacity(opacities[0])
                .animation(.linear.repeatForever().delay(0.15), value: opacities[1])
            Rectangle()
                .frame(width: dotSize, height: dotSize)
                .clipShape(ActualDotShape(shapeToDraw: dotsShape))
                .opacity(opacities[0])
                .offset(x: size * 0.3, y: 0)
                .animation(.linear.repeatForever().delay(0.3), value: opacities[2])
        }
        .frame(width: size, height: size)
        .foregroundColor(color)
        .onAppear{
            for i in 0..<opacities.count {
                opacities[i] = 0.2
            }
        }
    }
}

@available(iOS 13.0, *)
@available(macOS 10.15, *)
struct DisappearingLoadingDots_Previews: PreviewProvider {
    static var previews: some View {
        DisappearingLoadingDots()
    }
}

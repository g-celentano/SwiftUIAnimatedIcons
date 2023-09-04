//
//  SwiftUIView.swift
//
//
//  Created by Gaetano Celentano on 30/08/23.
//

import SwiftUI

/// DisappearingRects
/// Parameters list
/// - **size**: icon size
/// - **color**: icon color
/// - **duration**: opacity transition duration in **seconds**
/// - **delay**: delay between two cycles of an opacity transition

@available(iOS 13.0, *)
@available(iOS 10.15, *)
public struct DisappearingRects: View {
    public init(size: CGFloat = 48.0, color: Color = .black, duration: CGFloat = 0.5, delay: CGFloat = 0.2) {
        self.size = size
        self.color = color
        self.duration = duration
        self.delay = delay
    }

    @State private var size: CGFloat
    @State private var color: Color
    @State private var duration: CGFloat
    @State private var delay: CGFloat

    @State private var opacities = [0.2, 0.2, 0.2]

    public var body: some View {
        ZStack {
            Rectangle()
                .frame(width: size * 0.35, height: size * 0.75)
                .opacity(opacities[0])
                .animation(.linear(duration: duration).delay(delay).repeatForever(), value: opacities[0])
                .offset(x: -size * 0.4, y: 0.0)
            Rectangle()
                .frame(width: size * 0.35, height: size * 0.75)
                .opacity(opacities[1])
                .animation(.linear(duration: duration).delay(delay).repeatForever().delay(0.15), value: opacities[1])
            Rectangle()
                .frame(width: size * 0.35, height: size * 0.75)
                .opacity(opacities[2])
                .animation(.linear(duration: duration).delay(delay).repeatForever().delay(0.3), value: opacities[2])
                .offset(x: size * 0.4, y: 0.0)
        }
        .frame(width: size, height: size)
        .foregroundColor(color)
        .onAppear {
            for i in 0 ..< opacities.count {
                opacities[i] = 1.0
            }
        }
    }
}

@available(iOS 13.0, *)
@available(iOS 10.15, *)
struct DisappearingRects_Previews: PreviewProvider {
    static var previews: some View {
        DisappearingRects()
    }
}

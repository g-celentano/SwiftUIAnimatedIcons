//
//  SwiftUIView.swift
//
//
//  Created by Gaetano Celentano on 05/09/23.
//

import SwiftUI

/// DisappearingDotsSpinner
/// Parameters list:
/// - **size**: icon size
/// - **color**: icon color
/// - **dotsDistance**: value in **degrees** that indicates the distance between dots on the perimeter of the circle of radius _size / 2_

@available(iOS 13.0, *)
@available(macOS 10.15, *)
public struct DisappearingDotsSpinner: View {
    public init(size: CGFloat = 48.0, color: Color = .black, dotsDistance: Int = 30) {
        self.size = size
        self.color = color
        self.dotsDistance = dotsDistance

        var op: [Double] = []
        for _ in 0 ..< 360 / dotsDistance {
            op.append(0.0)
        }
        self.opacities = op
    }

    @State private var size: CGFloat
    @State private var color: Color
    @State private var dotsDistance: Int
    @State private var opacities: [Double]

    @State private var iconRotationDeg: CGFloat = 0.0

    public var body: some View {
        ZStack {
            let dotsNumber = 360 / dotsDistance
            let piFactor = 180.0 / Double(dotsDistance)
            ForEach(0 ..< dotsNumber, id: \.self) { dotIndex in
                let xOff = size * 0.5 * cos(.pi / piFactor * Double(dotIndex))
                let yOff = size * 0.5 * sin(-.pi / piFactor * Double(dotIndex))
                Circle()
                    .frame(width: size * 0.2)
                    .offset(x: xOff, y: yOff)
                    .opacity(opacities[dotIndex])
                    .animation(.linear.delay(0.03 * Double(dotsNumber)).repeatForever(autoreverses: false).delay(0.06 * Double(dotIndex)), value: opacities[dotIndex])
            }
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
@available(macOS 10.15, *)
struct DisappearingDotsSpinner_Previews: PreviewProvider {
    static var previews: some View {
        DisappearingDotsSpinner()
    }
}

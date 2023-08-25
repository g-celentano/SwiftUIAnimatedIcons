//
//  SwiftUIView.swift
//
//
//  Created by Gaetano Celentano on 25/08/23.
//

import SwiftUI

/// Sun-Moon icon
/// from sun to moon
/// Parameters list:
/// - **isSun**: state handle value
/// - **size**: icon size
/// - **duration**: animation duration
/// - **{sun, moon}Color**: color of the indicated icon

@available(iOS 13.0, *)
@available(macOS 10.15, *)
public struct Sun_Moon: View {
    public init(_ isSun: Binding<Bool>, size: CGFloat = 24.0, duration: CGFloat = 0.2, sunColor: Color = .black, moonColor: Color = .black) {
        _isSun = isSun
        self.size = size
        self.duration = duration
        self.sunColor = sunColor
        self.moonColor = moonColor
    }

    @Binding private var isSun: Bool
    @State private var size: CGFloat
    @State private var duration: CGFloat
    @State private var sunColor: Color
    @State private var moonColor: Color

    public var body: some View {
        ZStack {
            let innerCircleDiameter = isSun ? size * 0.5 : size * 0.7 // -> circle radius = size * 0.25
            let roundingCirclesDistance = isSun ? size * 0.4 : 0 // 15% more than the circle radius
            let roundingCirlcesRadii = isSun ? size * 0.15 : 0
            ZStack {
                Circle()
                    .frame(width: innerCircleDiameter, height: innerCircleDiameter)
                    .foregroundColor(isSun ? sunColor : moonColor)
                if !isSun {
                    Circle()
                        .frame(width: innerCircleDiameter * 0.75, height: innerCircleDiameter * 0.75)
                        .offset(x: innerCircleDiameter * 0.2, y: -innerCircleDiameter * 0.25)
                        .blendMode(.destinationOut)
                }
            }
            .compositingGroup()

            ForEach(0 ..< 8, id: \.self) { index in
                let xOffset = roundingCirclesDistance * cos(.pi / 4 * CGFloat(index))
                let yOffset = roundingCirclesDistance * sin(.pi / 4 * CGFloat(index))
                Circle()
                    .frame(width: roundingCirlcesRadii)
                    .offset(x: xOffset, y: yOffset)
                    .foregroundColor(sunColor)
            }
        }
        .frame(width: size, height: size)
        .onTapGesture {
            withAnimation(.easeOut(duration: duration)) {
                isSun.toggle()
            }
        }
    }
}

@available(iOS 13.0, *)
@available(macOS 10.15, *)
struct SunMoon_Previews: PreviewProvider {
    static var previews: some View {
        Sun_Moon(.constant(false), size: 150)
    }
}

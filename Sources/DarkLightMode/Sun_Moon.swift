//
//  SwiftUIView.swift
//
//
//  Created by Gaetano Celentano on 25/08/23.
//

import SwiftUI

public enum SunRayShape {
    case circle
    case roundedRectangle
    case triangle
}

/// Sun-Moon icon
/// from sun to moon
/// Parameters list:
/// - **isSun**: state handle value
/// - **size**: icon size
/// - **duration**: animation duration
/// - **{sun, moon}Color**: color of the indicated icon
/// - **sunRayShape**: enum value for sun ray shape ( circle, roundedRectangle, triangle)
/// - **bouncy**: is the animation bouncy?

@available(iOS 13.0, *)
@available(macOS 10.15, *)
public struct Sun_Moon: View {
    public init(_ isSun: Binding<Bool>, size: CGFloat = 24.0, duration: CGFloat = 0.35, sunColor: Color = .black, moonColor: Color = .black, sunRayShape: SunRayShape = .roundedRectangle, bouncy: Bool = true) {
        _isSun = isSun
        self.size = size
        self.duration = duration
        self.sunColor = sunColor
        self.moonColor = moonColor
        self.sunRaysShape = sunRayShape
        self.sunDotsVisible = isSun.wrappedValue
        self.sunDotsDistance = isSun.wrappedValue ? size * 0.4 : 0
        self.bouncy = bouncy
    }

    @Binding private var isSun: Bool
    @State private var size: CGFloat
    @State private var duration: CGFloat
    @State private var sunColor: Color
    @State private var moonColor: Color
    @State private var sunRaysShape: SunRayShape

    @State private var sunDotsDistance: CGFloat
    @State private var sunDotsVisible: Bool
    @State private var bouncy: Bool

    public var body: some View {
        ZStack {
            let innerCircleDiameter = isSun ? size * 0.5 : size * 0.7 // => circle radius = size * 0.25
            let roundingCirlcesRadii = sunDotsVisible ? size * 0.15 : 0

            ForEach(0 ..< 8, id: \.self) { index in
                let xOffset = sunDotsDistance * cos(.pi / 4 * CGFloat(index))
                let yOffset = sunDotsDistance * sin(.pi / 4 * CGFloat(index))
                if sunRaysShape == .circle {
                    Circle()
                        .frame(width: roundingCirlcesRadii, height: roundingCirlcesRadii)
                        .offset(x: xOffset, y: yOffset)
                        .foregroundColor(sunColor)
                } else if sunRaysShape == .roundedRectangle {
                    RoundedRectangle(cornerRadius: roundingCirlcesRadii * 0.1)
                        .frame(width: roundingCirlcesRadii * 0.9, height: roundingCirlcesRadii * 0.3)
                        .rotationEffect(.degrees(CGFloat(index) * 45.0), anchor: .center)
                        .offset(x: xOffset, y: yOffset)
                        .foregroundColor(sunColor)
                } else if sunRaysShape == .triangle {
                    SunRay()
                        .frame(width: roundingCirlcesRadii, height: roundingCirlcesRadii)
                        .rotationEffect(.degrees(CGFloat(index) * 45.0), anchor: .center)
                        .rotationEffect(.degrees(90))
                        .offset(x: xOffset, y: yOffset)
                        .foregroundColor(sunColor)
                }
            }

            ZStack {
                Circle()
                    .frame(width: innerCircleDiameter, height: innerCircleDiameter)
                    .foregroundColor(isSun ? sunColor : moonColor)

                Circle()
                    .frame(width: isSun ? 0 : innerCircleDiameter * 0.75, height: isSun ? 0 : innerCircleDiameter * 0.75)
                    .offset(x: innerCircleDiameter * 0.2, y: -innerCircleDiameter * 0.25)
                    .blendMode(.destinationOut)
            }
            .compositingGroup()
        }
        .frame(width: size, height: size)
        .onTapGesture {
            if bouncy {
                bouncyAnimation()
            } else {
                linearAnimation()
            }
        }
    }

    private func bouncyAnimation() {
        if isSun {
            withAnimation(.linear(duration: duration * 0.075)) {
                sunDotsDistance = size * 0.55
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + duration * 0.075) {
                withAnimation(.linear(duration: duration * 0.425)) {
                    sunDotsDistance = 0.0
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + duration * 0.425) {
                    sunDotsVisible = false
                    withAnimation(.linear(duration: duration * 0.5)) {
                        isSun = false
                    }
                }
            }

        } else {
            withAnimation(.linear(duration: duration * 0.5)) {
                isSun = true
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + duration * 0.5) {
                sunDotsVisible = true
                withAnimation(.linear(duration: duration * 0.425)) {
                    sunDotsDistance = size * 0.55
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + duration * 0.425) {
                    withAnimation(.linear(duration: duration * 0.075)) {
                        sunDotsDistance = size * 0.4
                    }
                }
            }
        }
    }

    private func linearAnimation() {
        if isSun {
            withAnimation(.linear(duration: duration * 0.5)) {
                sunDotsDistance = 0.0
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + duration * 0.5) {
                sunDotsVisible = false
                withAnimation(.linear(duration: duration * 0.5)) {
                    isSun = false
                }
            }

        } else {
            withAnimation(.linear(duration: duration * 0.5)) {
                isSun = true
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + duration * 0.5) {
                sunDotsVisible = true
                withAnimation(.linear(duration: duration * 0.5)) {
                    sunDotsDistance = size * 0.4
                }
            }
        }
    }
}

@available(iOS 13.0, *)
@available(macOS 10.15, *)
private struct SunRay: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.midX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            path.closeSubpath()
        }
    }
}

@available(iOS 13.0, *)
@available(macOS 10.15, *)
struct SunMoon_Previews: PreviewProvider {
    static var previews: some View {
        Sun_Moon(.constant(true), size: 150, sunRayShape: .triangle)
    }
}

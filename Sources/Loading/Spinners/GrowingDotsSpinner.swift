//
//  SwiftUIView.swift
//
//
//  Created by Gaetano Celentano on 05/09/23.
//

import SwiftUI

/// GrowingDotsSpinner
/// Parameters list:
/// - **size**: icon size
/// - **color**: icon color
/// - **minDotScale**: minimum scale value for the dot scaling animation
/// - **maxDotScale**: maximum scale value for the dot scaling animation
/// - **rotationSpeed**: rotation speed value to adjuste icon rotation speed
/// - **dotDistance**: value in **degrees** that indicates the distance between dots on the perimeter of the circle of radius _size / 2_

@available(iOS 13.0, *)
@available(macOS 10.15, *)
public struct GrowingDotsSpinner: View {
    public init(size: CGFloat = 48.0, color: Color = .black, minDotScale: CGFloat = 0.5, maxDotScale: CGFloat = 1, rotationSpeed: CGFloat = 0.1, dotDistance: Int = 30) {
        self.size = size
        self.color = color
        self.minDotScale = minDotScale
        self.maxDotScale = maxDotScale
        self.rotationSpeed = rotationSpeed
        self.dotDistance = dotDistance
        self.currentScale = minDotScale
        
        self.dotsNumber = 360 / dotDistance
    }

    @State private var size: CGFloat
    @State private var color: Color
    @State private var minDotScale: CGFloat
    @State private var maxDotScale: CGFloat
    @State private var rotationSpeed: CGFloat
    @State private var currentScale: CGFloat
    @State private var dotDistance: Int
    
    @State private var iconRotationDegree: CGFloat = 0.0
    @State private var dotsNumber: Int
    @State private var totalGrowingAnimationTime = 0.1
    

    public var body: some View {
        ZStack {
            // 360 / 30 is for calculating how many dots spaced by 30deg are in a full circle
            /* .pi / 6 is for setting the distance of 30deg between each dot, and the multiplication by the 'dotIndex' is for offsetting along the "trigonometric" circumference */
            ForEach(0 ..< dotsNumber, id: \.self) { dotIndex in
                let piFactor = CGFloat(180 / dotDistance)
                let xOffset = size * 0.5 * cos(.pi / piFactor * CGFloat(dotIndex))
                let yOffset = size * 0.5 * sin(.pi / piFactor * CGFloat(dotIndex))

                Circle()
                    .frame(width: size * 0.2)
                    .scaleEffect(currentScale, anchor: .center)
                    .offset(x: xOffset, y: yOffset)
                    .animation(.linear.delay(totalGrowingAnimationTime * Double(dotsNumber) / 3.5).repeatForever(autoreverses: true).delay(totalGrowingAnimationTime * Double(dotIndex)), value: currentScale)
            }
        }
        .frame(width: size, height: size)
        .foregroundColor(color)
        .rotationEffect(.degrees(iconRotationDegree))
        .animation(.linear.repeatForever(autoreverses: false).speed(rotationSpeed), value: iconRotationDegree)
        .onAppear{
            iconRotationDegree = -360.0
            currentScale = maxDotScale
            DispatchQueue.main.asyncAfter(deadline: .now() + totalGrowingAnimationTime * Double(dotsNumber) / 3) {
                currentScale = minDotScale
            }
        }
    }
}

@available(iOS 13.0, *)
@available(macOS 10.15, *)
struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        GrowingDotsSpinner()
    }
}

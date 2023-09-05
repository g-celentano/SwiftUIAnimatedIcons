//
//  SwiftUIView.swift
//
//
//  Created by Gaetano Celentano on 26/08/23.
//

import SwiftUI

/// LoadingSpinner animation:
/// Parameters list:
///  - **loadingAmount**: spinner "drawed" amount (from 10 to 340, degrees format)
///  - **size**: icon size
///  - **color**: icon color
///  - **ringBackgroundColor**: background color of the ring (_if needed_)
///  - **isRounded**: are lineCaps rounded?
///  - **rotationDuration**: time in **seconds** of a single rotation

@available(iOS 13.0, *)
@available(macOS 10.15, *)
public struct Spinner: View {
    public init(loadingAmount: CGFloat = 180, size: CGFloat = 48.0, color: Color = .black, ringBackgroundColor: Color = .clear, isRounded: Bool = true, rotationDuration: CGFloat = 1.0) {
        var clippedLoadingAmount: CGFloat = 0

        if loadingAmount < 10 {
            clippedLoadingAmount = 10
        } else if loadingAmount > 340 {
            clippedLoadingAmount = 340
        } else {
            clippedLoadingAmount = loadingAmount
        }

        self.loadingAmount = clippedLoadingAmount
        self.size = size
        self.color = color
        self.ringBackgroundColor = ringBackgroundColor
        self.isRounded = isRounded
        self.rotationDuration = rotationDuration
    }

    @State private var loadingAmount: CGFloat
    @State private var size: CGFloat
    @State private var color: Color
    @State private var ringBackgroundColor: Color
    @State private var isRounded: Bool
    @State private var rotationDuration: CGFloat
    @State private var rotationValue = 0.0

    public var body: some View {
        ZStack {
            let ringSize = size * 0.1
            Circle()
                .stroke(ringBackgroundColor, style: StrokeStyle(lineWidth: ringSize))
            Circle()
                .trim(from: 0, to: loadingAmount / 360)
                .stroke(color, style: StrokeStyle(lineWidth: ringSize, lineCap: isRounded ? .round : .square))
                .rotationEffect(.degrees(rotationValue))
                .animation(.linear(duration: rotationDuration).delay(0.0001).repeatForever(autoreverses: false), value: rotationValue) // delay added for animation smoothness
        }
        .frame(width: size, height: size)
        .onAppear {
            rotationValue = 360
        }
    }
}

@available(iOS 13.0, *)
@available(macOS 10.15, *)
struct LoadingSinner_Previews: PreviewProvider {
    static var previews: some View {
        Spinner(loadingAmount: 270, size: 250, ringBackgroundColor: .gray.opacity(0.3))
    }
}

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
///  - **isRounded**: are lineCaps rounded?
///  - **rotationDuration**: time in **seconds** of a single rotation

@available(iOS 13.0, *)
@available(macOS 10.15, *)
public struct LoadingSpinner: View {
    public init(loadingAmount: CGFloat = 180, size: CGFloat = 24.0, color: Color = .black, isRounded: Bool = true, rotationDuration: CGFloat = 1.0) {
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
        self.isRounded = isRounded
        self.rotationDuration = rotationDuration
    }

    @State private var loadingAmount: CGFloat
    @State private var size: CGFloat
    @State private var color: Color
    @State private var isRounded: Bool
    @State private var rotationDuration: CGFloat
    @State private var rotationValue = 0.0

    public var body: some View {
        ZStack {
            Circle()
                .trim(from: 0, to: loadingAmount / 360)
                .stroke(color, style: StrokeStyle(lineWidth: size * 0.1, lineCap: isRounded ? .round : .square))
                .rotationEffect(.degrees(rotationValue))
                .animation(.linear(duration: rotationDuration).repeatForever(autoreverses: false), value: rotationValue)
        }
        .frame(width: size, height: size)
        .onAppear{
            rotationValue = 360
        }
    }
}

@available(iOS 13.0, *)
@available(macOS 10.15, *)
struct LoadingSinner_Previews: PreviewProvider {
    static var previews: some View {
        LoadingSpinner(loadingAmount: 500, size: 250)
    }
}

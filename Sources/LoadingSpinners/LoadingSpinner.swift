//
//  SwiftUIView.swift
//
//
//  Created by Gaetano Celentano on 26/08/23.
//

import SwiftUI

/// LoadingSpinner animation:
/// Parameters list:
///  - **loadingAmount**: spinner "drawed" amount (from 0 to 360)
///  - **size**: icon size
///  - **color**: icon color
///  - **isRounded**: are lineCaps rounded?
///  - **rotationSpeed**: multiplicative constant for animation speed management

@available(iOS 13.0, *)
@available(macOS 10.15, *)
public struct LoadingSpinner: View {
    public init(loadingAmount: CGFloat = 180, size: CGFloat = 24.0, color: Color = .black, isRounded: Bool = true, rotationSpeed: CGFloat = 1.0) {
        assert(loadingAmount >= 0 && loadingAmount <= 360)
        self.loadingAmount = loadingAmount
        self.size = size
        self.color = color
        self.isRounded = isRounded
        self.rotationSpeed = rotationSpeed
    }

    @State private var loadingAmount: CGFloat
    @State private var size: CGFloat
    @State private var color: Color
    @State private var isRounded: Bool
    @State private var rotationSpeed: CGFloat
    @State private var rotationValue = 0.0
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()

    public var body: some View {
        ZStack {
            Circle()
                .trim(from: 0, to: loadingAmount / 360)
                .stroke(color, style: StrokeStyle(lineWidth: size * 0.1, lineCap: isRounded ? .round : .square))
                .rotationEffect(.degrees(rotationValue))
                .animation(.easeOut, value: rotationValue)
                .onReceive(timer) { _ in
                    rotationValue += 45 * rotationSpeed
                }
        }
        .frame(width: size, height: size)
    }
}

@available(iOS 13.0, *)
@available(macOS 10.15, *)
struct LoadingSinner_Previews: PreviewProvider {
    static var previews: some View {
        LoadingSpinner(loadingAmount: 300, size: 250)
    }
}

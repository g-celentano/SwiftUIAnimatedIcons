//
//  SwiftUIView.swift
//
//
//  Created by Gaetano Celentano on 05/09/23.
//

import SwiftUI

/// GrowingSpinner
/// Parameters list:
/// - **size**: icon size
/// - **spinnerColor**: spinner ring color
/// - **spinnerBgColor**: spinner background ring color
/// - **rotationDuration**: duration time of a single rotation, in **seconds**

@available(iOS 13.0, *)
@available(macOS 10.15, *)
public struct GrowingSpinner: View {
    public init(size: CGFloat = 48.0, spinnerColor: Color = .black, spinnerBgColor: Color = .clear, rotationDuration: CGFloat = 1.0) {
        self.size = size
        self.spinnerColor = spinnerColor
        self.spinnerBgColor = spinnerBgColor
        self.rotationDuration = rotationDuration

        self.timer = Timer.publish(every: rotationDuration * 1.1, on: .main, in: .common) // "rotationDuration * 1.1" in order to have enough time to complete the animation
    }

    @State private var size: CGFloat
    @State private var spinnerColor: Color
    @State private var spinnerBgColor: Color
    @State private var rotationDuration: CGFloat

    @State private var trimFrom: CGFloat = 0.0
    @State private var trimTo: CGFloat = 0.5
    @State private var iconRotationDegree = 0.0
    private let timer: Timer.TimerPublisher

    public var body: some View {
        ZStack {
            let lineWidth = size * 0.1
            Circle()
                .stroke(lineWidth: lineWidth)
                .foregroundColor(spinnerBgColor)
            Circle()
                .trim(from: trimFrom, to: trimTo)
                .stroke(spinnerColor, style: StrokeStyle(lineWidth: lineWidth, lineCap: .round, lineJoin: .round))
                .onReceive(timer) { _ in
                    withAnimation(.linear(duration: rotationDuration / 2)) {
                        trimFrom = trimFrom == 0.5 ? 0.0 : 0.5
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + rotationDuration / 2) {
                        withAnimation(.linear(duration: rotationDuration / 2)) {
                            trimTo = trimTo == 1.0 ? 0.5 : 1.0
                        }
                    }
                }
        }
        .frame(width: size, height: size)
        .rotationEffect(.degrees(iconRotationDegree))
        .animation(.linear(duration: rotationDuration).repeatForever(autoreverses: false), value: iconRotationDegree)
        .onAppear {
            _ = timer.connect()
            iconRotationDegree = 360.0
        }
    }
}

@available(iOS 13.0, *)
@available(macOS 10.15, *)
struct GrowingSpinner_Previews: PreviewProvider {
    static var previews: some View {
        GrowingSpinner()
    }
}

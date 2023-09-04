//
//  SwiftUIView.swift
//
//
//  Created by Gaetano Celentano on 04/09/23.
//

import SwiftUI

/// PulsingSquares
/// Parameters list:
/// - **cornerRadius**: percentage amount to apply for making the squares with rounded corners (0.0 -> square; >0.5 -> circle)
/// - **size**: icon size
/// - **color**: icon color
/// - **duration**: animation duration, in **seconds**
/// - **delay**: delay between the completion of the animations, in **seconds**

@available(iOS 13.0, *)
@available(macOS 10.15, *)
public struct PulsingSquares: View {
    public init(cornerRadius: CGFloat = 0.1, size: CGFloat = 48.0, color: Color = .black, duration: CGFloat = 0.15, delay: CGFloat = 0.3) {
        if cornerRadius < 0.0 {
            self.cornerRadius = 0
        } else if cornerRadius > 1.0 {
            self.cornerRadius = 1.0
        } else {
            self.cornerRadius = cornerRadius
        }
        self.size = size
        self.color = color
        self.duration = duration
        self.delay = delay

        self.squareSize = size * 0.475
    }

    @State private var cornerRadius: CGFloat
    @State private var size: CGFloat
    @State private var color: Color
    @State private var duration: CGFloat
    @State private var delay: CGFloat

    @State private var squareSize: CGFloat

    public var body: some View {
        ZStack {
            let delayBetweenSquares = duration * 0.5
            
            // Vertical Arrangement
            VStack(spacing: size * 0.075) {
                // top row
                HStack(spacing: size * 0.075) {
                    RoundedRectangle(cornerRadius: squareSize * cornerRadius)
                        .frame(width: squareSize, height: squareSize)
                        .animation(.linear(duration: duration).delay(duration + delay).repeatForever().delay(delayBetweenSquares), value: squareSize)
                    RoundedRectangle(cornerRadius: squareSize * cornerRadius)
                        .frame(width: squareSize, height: squareSize)
                        .animation(.linear(duration: duration).delay(duration + delay).repeatForever().delay(delayBetweenSquares * 2.0), value: squareSize)
                }
                // bottom row
                HStack(spacing: size * 0.075) {
                    RoundedRectangle(cornerRadius: squareSize * cornerRadius)
                        .frame(width: squareSize, height: squareSize)
                        .animation(.linear(duration: duration).delay(duration + delay).repeatForever().delay(delayBetweenSquares * 4.0), value: squareSize)
                    RoundedRectangle(cornerRadius: squareSize * cornerRadius)
                        .frame(width: squareSize, height: squareSize)
                        .animation(.linear(duration: duration).delay(duration + delay).repeatForever().delay(delayBetweenSquares * 3.0), value: squareSize)
                }
            }
        }
        .frame(width: size, height: size)
        .foregroundColor(color)
        .onAppear {
            squareSize = size * 0.575
            DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
                squareSize = size * 0.475
            }
        }
    }
}

@available(iOS 13.0, *)
@available(macOS 10.15, *)
struct PulsingSquares_Previews: PreviewProvider {
    static var previews: some View {
        PulsingSquares()
    }
}

//
//  SwiftUIView.swift
//
//
//  Created by Gaetano Celentano on 11/09/23.
//

import SwiftUI

/// Play-Pause
/// Parameters list:
/// - **iconState**: state handle value
/// - **size**: icon size
/// - **color**: icon color
/// - **duration**: animation duration

@available(iOS 13.0, *)
@available(macOS 10.15, *)
public struct Play_Pause: View {
    public init(_ iconState: Binding<Bool>, size: CGFloat = 24.0, color: Color = .black, duration: CGFloat = 0.3) {
        _isPlay = iconState
        self.size = size
        self.color = color
        self.duration = duration

        if iconState.wrappedValue {
            canTrim = true
        } else {
            canTrim = false
        }
    }

    @Binding private var isPlay: Bool
    @State private var size: CGFloat
    @State private var color: Color
    @State private var duration: CGFloat
    @State private var canTrim: Bool

    public var body: some View {
        ZStack {
            Rectangle()
                .trim(from: 0, to: canTrim ? 0.5 : 1.0)
                .rotationEffect(.degrees(180))
                .frame(width: isPlay ? size : size * 0.35, height: isPlay ? size * 0.5 : size)
                .offset(x: isPlay ? 0 : -size * 0.25, y: isPlay ? -size * 0.25 : 0)

            Rectangle()
                .trim(from: 0, to: canTrim ? 0.5 : 1.0)
                .rotation3DEffect(.degrees(180), axis: (x: 0.0, y: 1.0, z: 0.0))
                .frame(width: isPlay ? size : size * 0.35, height: isPlay ? size * 0.5 : size)
                .offset(x: isPlay ? 0 : size * 0.25, y: isPlay ? size * 0.25 : 0)
        }
        .frame(width: size, height: size)
        .foregroundColor(color)
        .onTapGesture {
            if isPlay {
                withAnimation(.linear(duration: duration * 0.5)) {
                    canTrim = false
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + duration * 0.5) {
                    withAnimation(.linear(duration: duration * 0.5)) {
                        isPlay = false
                    }
                }
            } else {
                withAnimation(.linear(duration: duration * 0.5)) {
                    isPlay = true
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + duration * 0.5) {
                    withAnimation(.linear(duration: duration * 0.5)) {
                        canTrim = true
                    }
                }
            }
        }
    }
}

@available(iOS 13.0, *)
@available(macOS 10.15, *)
struct Play_Pause_Previews: PreviewProvider {
    static var previews: some View {
        Play_Pause(.constant(false), size: 200)
    }
}

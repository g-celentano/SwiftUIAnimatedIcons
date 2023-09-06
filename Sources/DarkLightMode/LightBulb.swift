//
//  SwiftUIView.swift
//
//
//  Created by Gaetano Celentano on 06/09/23.
//

import SwiftUI

/// LightBulb
/// Parameters list:
/// - **isSelected**: state handle value
/// - **size**: icon size
/// - **onColor**: color for **isSelected = _true_**
/// - **offColor**: color for **isSelected = _false_**

@available(iOS 13.0, *)
@available(macOS 10.15, *)
public struct LightBulb: View {
    public init(_ isSelected: Binding<Bool>, size: CGFloat = 24.0, onColor: Color = .black, offColor: Color = .black, duration: CGFloat = 0.5) {
        _isSelected = isSelected

        self.size = size
        self.onColor = onColor
        self.offColor = offColor
        self.duration = duration

        if isSelected.wrappedValue {
            self.circleOn = true
            self.rectangleOn = true
        } else {
            self.circleOn = false
            self.rectangleOn = false
        }
    }

    @Binding private var isSelected: Bool
    @State private var size: CGFloat
    @State private var onColor: Color
    @State private var offColor: Color
    @State private var duration: CGFloat

    @State private var circleOn: Bool
    @State private var rectangleOn: Bool

    public var body: some View {
        VStack {
            ZStack {
                ZStack {
                    Circle()
                        .frame(width: size * 0.8)
                    RoundedRectangle(cornerRadius: size * 0.04)
                        .frame(width: size * 0.5, height: size * 0.2)
                        .offset(x: 0, y: size * 0.35)
                }

                ZStack {
                    Circle()
                        .frame(width: size * 0.675, height: circleOn ? size * 0.675 : 0.0)
                    VStack{
                        RoundedRectangle(cornerRadius: size * 0.04)
                            .frame(width: size * 0.4, height: rectangleOn ? size * 0.15 : 0.0)
                            .offset(x: 0, y: size * 0.315)
                    }
                    .frame(width: size * 0.4, height:size * 0.15, alignment: .bottom)
                }
                .blendMode(.destinationOut)
            }
            .compositingGroup()
            RoundedRectangle(cornerRadius: size * 0.04)
                .frame(width: size * 0.5, height: size * 0.05)
                .foregroundColor(.clear)
            RoundedRectangle(cornerRadius: size * 0.04)
                .frame(width: size * 0.5, height: size * 0.1)
        }
        .frame(width: size, height: size)
        .foregroundColor(isSelected ? onColor : offColor)
        .onTapGesture {
            withAnimation {
                if isSelected {
                    isSelected = false
                    withAnimation(.linear(duration: duration * 0.5)) {
                        circleOn = false
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + duration * 0.5) {
                        withAnimation(.linear(duration: duration * 0.5)) {
                            rectangleOn = false
                        }
                    }
                } else {
                    isSelected = true
                    withAnimation(.linear(duration: duration * 0.5)) {
                        rectangleOn = true
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + duration * 0.5) {
                        withAnimation(.linear(duration: duration * 0.5)) {
                            circleOn = true
                        }
                    }
                }
            }
        }
    }
}

@available(iOS 13.0, *)
@available(macOS 10.15, *)
struct LightBulb_Previews: PreviewProvider {
    static var previews: some View {
        LightBulb(.constant(true), size: 300)
    }
}

//
//  SwiftUIView.swift
//
//
//  Created by Gaetano Celentano on 06/09/23.
//

import SwiftUI

@available(iOS 13.0, *)
@available(macOS 10.15, *)
public struct LightBulb: View {
    public init(_ isSelected: Binding<Bool>, size: CGFloat = 24.0, onColor: Color = .black, offColor: Color = .black) {
        _isSelected = isSelected

        self.size = size
        self.onColor = onColor
        self.offColor = offColor
    }

    @Binding private var isSelected: Bool
    @State private var size: CGFloat
    @State private var onColor: Color
    @State private var offColor: Color

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
                        .frame(width: size * 0.675)
                    RoundedRectangle(cornerRadius: size * 0.04)
                        .frame(width: size * 0.4, height: size * 0.15)
                        .offset(x: 0, y: size * 0.315)
                }
                .blendMode(isSelected ? .destinationOver : .destinationOut)
            }
            .compositingGroup()
            RoundedRectangle(cornerRadius: size * 0.04)
                .frame(width: size * 0.5, height: size * 0.05)
                .foregroundColor(.clear)
            RoundedRectangle(cornerRadius: size * 0.04)
                .frame(width: size * 0.5, height: size * 0.12)
        }
        .frame(width: size, height: size)
        .foregroundColor(isSelected ? onColor : offColor)
        .onTapGesture {
            withAnimation {
                isSelected.toggle()
            }
        }
    }
}

@available(iOS 13.0, *)
@available(macOS 10.15, *)
struct LightBulb_Previews: PreviewProvider {
    static var previews: some View {
        LightBulb(isSelected: .constant(false), size: 300)
    }
}

//
//  SwiftUIView.swift
//
//
//  Created by Gaetano Celentano on 08/09/23.
//

import SwiftUI

/// BurgerMenu-BackArrow
/// Parameters list:
/// - **isMenu**: state handle value
/// - **size**: icon size
/// - **{burger,arrow}Color**: specified icon color
/// - **duration**: animation duration

@available(iOS 13.0, *)
@available(macOS 10.15, *)
public struct BurgerMenu_BackArrow: View {
    public init(_ isMenu: Binding<Bool>, size: CGFloat = 24.0, burgerColor: Color = .black, arrowColor: Color = .black, duration: CGFloat = 0.4) {
        _isMenu = isMenu

        self.size = size
        self.burgerColor = burgerColor
        self.arrowColor = arrowColor
        self.duration = duration
    }

    @Binding private var isMenu: Bool
    @State private var size: CGFloat
    @State private var burgerColor: Color
    @State private var arrowColor: Color
    @State private var duration: CGFloat

    public var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: size * 0.5)
                .frame(width: isMenu ? size : size * 0.7, height: size * 0.15)
                .offset(x: 0, y: -size * 0.25)
                .rotationEffect(isMenu ? .degrees(0) : .degrees(40))

            RoundedRectangle(cornerRadius: size * 0.5)
                .frame(width: isMenu ? size : size * 0.9, height: size * 0.15)

            RoundedRectangle(cornerRadius: size * 0.5)
                .frame(width: isMenu ? size : size * 0.7, height: size * 0.15)
                .offset(x: 0, y: size * 0.25)
                .rotationEffect(isMenu ? .degrees(0) : .degrees(-40))
        }
        .frame(width: size, height: size)
        .foregroundColor(isMenu ? burgerColor : arrowColor)
        .rotationEffect(isMenu ? .degrees(0) : .degrees(180))
        .onTapGesture {
            withAnimation(.linear(duration: duration)) {
                isMenu.toggle()
            }
        }
    }
}

@available(iOS 13.0, *)
@available(macOS 10.15, *)
struct BurgerMenu_BackArrow_Previews: PreviewProvider {
    static var previews: some View {
        BurgerMenu_BackArrow(.constant(false), size: 100)
    }
}

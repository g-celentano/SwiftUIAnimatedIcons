//
//  SwiftUIView.swift
//
//
//  Created by Gaetano Celentano on 24/08/23.
//

import SwiftUI

/// BurgerMenu_Cross Icon
/// From Burger menu icon to cross icon
/// **parameters list**:
/// - **menuState**: state handle value
/// - **size**: icon size
/// - **{burger, cross}Color**: color of the specified icon in-between _{}_
/// - **duration**: animation duration
/// - **isRounded**: rounded line-caps flag

@available(iOS 13.0, *)
@available(macOS 10.15, *)
public struct BurgerMenu_Cross: View {
    public init(_ menuState: Binding<Bool>, size: CGFloat = 24, burgerColor: Color = .black, crossColor: Color = .black, duration: CGFloat = 0.35, isRounded: Bool = false) {
        _isMenuOpen = menuState
        self.size = size
        self.burgerColor = burgerColor
        self.crossColor = crossColor
        self.duration = duration
        self.isRounded = isRounded
    }

    @Binding private var isMenuOpen: Bool
    @State private var isMenuOpening: Bool = false
    @State private var size: CGFloat
    @State private var burgerColor: Color
    @State private var crossColor: Color
    @State private var duration: CGFloat
    @State private var isRounded: Bool

    public var body: some View {
        ZStack {
            // top one
            Rectangle()
                .frame(width: size, height: isMenuOpen ? size * 0.2 : size * 0.15)
                .cornerRadius(isRounded ? size * 0.5 : size * 0.05)
                .offset(x: 0, y: isMenuOpening ? 0 : -size * 0.225)
                .rotationEffect(isMenuOpen ? .degrees(45) : .zero)

            // bottom one
            Rectangle()
                .frame(width: size, height: isMenuOpen ? size * 0.2 : size * 0.15)
                .cornerRadius(isRounded ? size * 0.5 : size * 0.05)
                .offset(x: 0, y: isMenuOpening ? 0 : size * 0.225)
                .rotationEffect(isMenuOpen ? .degrees(45) : .zero)

            // center one
            Rectangle()
                .frame(width: size, height: isMenuOpen ? size * 0.2 : size * 0.15)
                .cornerRadius(isRounded ? size * 0.5 : size * 0.05)
                .rotationEffect(isMenuOpen ? .degrees(-45) : .zero)
        }
        .frame(width: size, height: size)
        .onTapGesture {
            if isMenuOpen {
                withAnimation(.linear(duration: duration * 0.5)) {
                    isMenuOpen = false
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + duration * 0.5) {
                    withAnimation(.linear(duration: duration * 0.5)) {
                        isMenuOpening = false
                    }
                }
            } else {
                withAnimation(.linear(duration: duration * 0.5)) {
                    isMenuOpening = true
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + duration * 0.5) {
                    withAnimation(.linear(duration: duration * 0.5)) {
                        isMenuOpen = true
                    }
                }
            }
        }
    }
}

@available(iOS 13.0, *)
@available(macOS 10.15, *)
struct BurgerMenu_Previews: PreviewProvider {
    static var previews: some View {
        BurgerMenu_Cross(.constant(false), size: 150)
    }
}

//
//  SwiftUIView.swift
//
//
//  Created by Gaetano Celentano on 08/09/23.
//

import SwiftUI

/// BurgerMenu-BackArrow
/// Parameters list:
/// - **menuState**: state handle value
///     - **true** : back arrow icon
///     - **false**: burger menu icon
/// - **size**: icon size
/// - **{burger,arrow}Color**: specified icon color
/// - **duration**: animation duration

@available(iOS 13.0, *)
@available(macOS 10.15, *)
public struct BurgerMenu_BackArrow: View {
    public init(_ menuState: Binding<Bool>, size: CGFloat = 24.0, burgerColor: Color = .black, arrowColor: Color = .black, duration: CGFloat = 0.4) {
        _menuState = menuState

        self.size = size
        self.burgerColor = burgerColor
        self.arrowColor = arrowColor
        self.duration = duration
    }

    @Binding private var menuState: Bool
    @State private var size: CGFloat
    @State private var burgerColor: Color
    @State private var arrowColor: Color
    @State private var duration: CGFloat

    public var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: size * 0.5)
                .frame(width: menuState ? size * 0.7 : size, height: size * 0.15)
                .offset(x: 0, y: -size * 0.25)
                .rotationEffect(menuState ? .degrees(40) : .degrees(0))

            RoundedRectangle(cornerRadius: size * 0.5)
                .frame(width: menuState ? size * 0.9 : size, height: size * 0.15)

            RoundedRectangle(cornerRadius: size * 0.5)
                .frame(width: menuState ? size * 0.7 : size, height: size * 0.15)
                .offset(x: 0, y: size * 0.25)
                .rotationEffect(menuState ? .degrees(-40) : .degrees(0))
        }
        .frame(width: size, height: size)
        .foregroundColor(menuState ? arrowColor : burgerColor)
        .rotationEffect(menuState ? .degrees(-180) : .degrees(0))
        .onTapGesture {
            withAnimation(.linear(duration: duration)) {
                menuState.toggle()
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

//
//  SwiftUIView.swift
//
//
//  Created by Gaetano Celentano on 22/08/23.
//

import Foundation
import SwiftUI

@available(iOS 13.0, *)
@available(macOS 10.15, *)
/// MoreVert-Cross Animated Icon
/// From vetically arranged more dots to cross icon
/// Parameters list:
///     - **isSelected**: state handle value
///         - **true** state -> cross icon
///         - **false** state -> horizontal more dots icon
///     - **size**: icon size
///     - **duration**: animation duration
///     - **{dots, cross}color**: color for each category in-between _{}_
public struct MoreVert_Cross: View {
    public init(isSelected: Binding<Bool>, size: CGFloat = 24.0, duration: CGFloat = 0.1,
                dotsColor: Color = .black, crossColor: Color = .black, isRounded: Bool = false)
    {
        _isSelected = isSelected
        self.size = size
        self.duration = duration
        self.dotsColor = dotsColor
        self.crossColor = crossColor
        self.isRounded = isRounded
    }

    @Binding private var isSelected: Bool
    @State private var size: CGFloat
    @State private var duration: CGFloat
    @State private var dotsColor: Color
    @State private var crossColor: Color
    @State private var isRounded: Bool

    public var body: some View {
        ZStack {
            Circle()
                .frame(width: isSelected ? size * 0.1 : size * 0.3)
                .offset(x: 0, y: isSelected ? 0 : -size * 0.35)
                .foregroundColor(dotsColor)
            Circle()
                .frame(width: isSelected ? size * 0.1 : size * 0.3)
                .offset(x: 0, y: isSelected ? 0 : size * 0.35)
                .foregroundColor(dotsColor
                )
            ZStack {
                Rectangle()
                    .frame(width: isSelected ? size * 0.22 : size * 0.3)
                    .cornerRadius(isSelected ? (isRounded ? size * 0.5 : size * 0.05) : size)
                    .rotationEffect(.degrees(-45), anchor: .center)
                Rectangle()
                    .frame(width: isSelected ? size * 0.22 : size * 0.3)
                    .cornerRadius(isSelected ? (isRounded ? size * 0.5 : size * 0.05) : size)
                    .rotationEffect(.degrees(45), anchor: .center)
            }
            .frame(width: size * 0.3, height: isSelected ? size : size * 0.3)
            .foregroundColor(isSelected ? crossColor : dotsColor)
        }
        .frame(width: size, height: size)
        .onTapGesture {
            withAnimation(.linear(duration: duration)) {
                isSelected.toggle()
            }
        }
    }
}

@available(iOS 13.0, *)
@available(macOS 10.15, *)
struct MoreVert_Cross_Previews: PreviewProvider {
    static var previews: some View {
        MoreVert_Cross(isSelected: .constant(true), size: 200, isRounded: true)
    }
}

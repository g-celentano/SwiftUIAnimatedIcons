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
/// MoreHor-Cross Animated Icon
/// From horizontally arranged more dots to cross icon.
/// Parameters list:
/// - **isSelected**: state handle
///     - **true** state -> cross
///     - **false** state -> horizontal more dots icon
/// - **size**: icon size
/// - **duration**: animation duration
/// - **{firstDot, secondDot, thirdDot, cross}color**: color for each category in-between _{}_
public struct MoreHor_Cross: View {
    public init(isSelected: Binding<Bool>, size: CGFloat = 24.0, duration: CGFloat = 0.1,
                firstDotColor: Color = .black, secondDotColor: Color = .black, thirdDotColor: Color = .black, crossColor: Color = .black) {
        _isSelected = isSelected
        self.size = size
        self.duration = duration
        self.firstDotColor = firstDotColor
        self.secondDotColor = secondDotColor
        self.thirdDotColor = thirdDotColor
        self.crossColor = crossColor
    }

    @Binding private var isSelected: Bool
    @State private var size: CGFloat
    @State private var duration: CGFloat
    @State private var firstDotColor: Color
    @State private var secondDotColor: Color
    @State private var thirdDotColor: Color
    @State private var crossColor: Color

    public var body: some View {
        ZStack {
            Circle()
                .frame(width: isSelected ? size * 0.1 : size * 0.3)
                .offset(x: isSelected ? 0 : -size * 0.35, y: 0)
                .foregroundColor(firstDotColor)
            Circle()
                .frame(width: isSelected ? size * 0.1 : size * 0.3)
                .offset(x: isSelected ? 0 : size * 0.35, y: 0)
                .foregroundColor(thirdDotColor)
            ZStack {
                Rectangle()
                    .frame(width: isSelected ? size * 0.22 : size * 0.3)
                    .cornerRadius(isSelected ? 0 : size)
                    .rotationEffect(.degrees(-45), anchor: .center)
                Rectangle()
                    .frame(width: isSelected ? size * 0.22 : size * 0.3)
                    .cornerRadius(isSelected ? 0 : size)
                    .rotationEffect(.degrees(45), anchor: .center)
            }
            .frame(width: size * 0.3, height: isSelected ? size : size * 0.3)
            .foregroundColor(isSelected ? crossColor : secondDotColor)
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
struct MoreHor_Cross_Previews: PreviewProvider {
    static var previews: some View {
        MoreHor_Cross(isSelected: .constant(true), size: 24)
    }
}

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
/// MoreHor_Cross Animated Icon
/// From horizontally arranged more dots to cross icon
/// Parameters list:
///     - isSelected: state handle value
///         - **true** state -> cross icon
///         - **false** state -> horizontal more dots icon
///     - size: icon size
///     - duration: animation duration
///     - colors: array of colors - [first dot color, second dot color, third dot color, cross 
public struct MoreHor_Cross: View {
    public init(isSelected: Binding<Bool>, size: CGFloat? = nil, duration: CGFloat? = nil, colors: [Color?] = []) {
        _isSelected = isSelected
        self.size = size ?? 24.0
        self.duration = duration ?? 0.1
        self.firstDotColor = colors[0] ?? .black
        self.secondDotColor = colors[1] ?? .black
        self.thirdDotColor = colors[2] ?? .black
        self.crossColor = colors[3] ?? .black
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

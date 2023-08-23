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
///     - **colors**: array of colors - [first dot color, second dot color, third dot color, cross color]
public struct MoreVert_Cross: View {
    public init(isSelected: Binding<Bool>, size: CGFloat = 24.0, duration: CGFloat = 0.1, colors: [Color] = [.black, .black, .black, .black]) {
        _isSelected = isSelected

        self.size = size
        self.duration = duration
        self.firstDotColor = colors[0]
        self.secondDotColor = colors[1]
        self.thirdDotColor = colors[2]
        self.crossColor = colors[3]
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
                .offset(x: 0, y: isSelected ? 0 : -size * 0.35)
                .foregroundColor(firstDotColor)
            Circle()
                .frame(width: isSelected ? size * 0.1 : size * 0.3)
                .offset(x: 0, y: isSelected ? 0 : size * 0.35)
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
struct MoreVert_Cross_Previews: PreviewProvider {
    static var previews: some View {
        MoreVert_Cross(isSelected: .constant(false), size: 24)
    }
}

//
//  SwiftUIView.swift
//
//
//  Created by Gaetano Celentano on 23/08/23.
//

import SwiftUI

@available(iOS 13.0, *)
@available(macOS 10.0, *)
/// Add-Cross Animated Icon
/// From plus icon to cross icon
/// **Parameters list**:
///  - **isSelected**: state handle value:
///     - **true** state -> cross icon
///     - **false** state -> add icon
///  - **size**: icon size
///  - **duration**: animation duration
///  - **plusColor** : plus icon color
///  - **crossColor** : cross icon color
public struct Add_Cross: View {
    public init(isSelected: Binding<Bool>, size: CGFloat = 24.0, duration: CGFloat = 0.25,
                plusColor: Color = .black, crossColor: Color = .black, isRounded: Bool = false)
    {
        _isSelected = isSelected
        self.size = size
        self.duration = duration
        self.plusColor = plusColor
        self.crossColor = crossColor
        self.isRounded = isRounded
    }

    @Binding private var isSelected: Bool
    @State private var size: CGFloat
    @State private var duration: CGFloat
    @State private var plusColor: Color
    @State private var crossColor: Color
    @State private var isRounded: Bool

    public var body: some View {
        ZStack {
            Rectangle()
                .frame(width: size * 0.2, height: size)
                .cornerRadius(isRounded ? size * 0.5 : size * 0.05)
            Rectangle()
                .frame(width: size * 0.2, height: size)
                .cornerRadius(isRounded ? size * 0.5 : size * 0.05)
                .rotationEffect(.degrees(90), anchor: .center)
        }
        .frame(width: size, height: size, alignment: .center)
        .foregroundColor(isSelected ? crossColor : plusColor)
        .rotationEffect(isSelected ? .degrees(-225) : .degrees(0))
        .onTapGesture {
            withAnimation(.linear(duration: duration)) {
                isSelected.toggle()
            }
        }
    }
}

@available(iOS 13.0, *)
@available(macOS 10.0, *)
struct AddCross_Previews: PreviewProvider {
    static var previews: some View {
        Add_Cross(isSelected: .constant(false), isRounded: false)
    }
}

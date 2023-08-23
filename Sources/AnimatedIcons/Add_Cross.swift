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
                plusColor: Color = .black, crossColor: Color = .black)
    {
        _isSelected = isSelected
        self.size = size
        self.duration = duration
        self.plusColor = plusColor
        self.crossColor = crossColor
    }

    @Binding var isSelected: Bool
    @State var size: CGFloat
    @State var duration: CGFloat
    @State var plusColor: Color
    @State var crossColor: Color

    public var body: some View {
        ZStack {
            Rectangle()
                .frame(width: size * 0.2, height: size)
            Rectangle()
                .frame(width: size * 0.2, height: size)
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
        Add_Cross(isSelected: .constant(true))
    }
}

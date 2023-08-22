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
public struct MoreVert_Cross: View {
    public init(size: CGFloat? = nil, isSelected: Binding<Bool>) {
        self.size = size ?? 40.0
        _isSelected = isSelected
    }

    @Binding private var isSelected: Bool
    @State private var size: CGFloat
    public var body: some View {
        ZStack {
            Circle()
                .frame(width: size * 0.3)
                .offset(x: 0, y: isSelected ? 0 : -size * 0.35)
                .foregroundColor(.red)
            Circle()
                .frame(width: size * 0.3)
                .foregroundColor(.blue)
            Circle()
                .frame(width: size * 0.3)
                .offset(x: 0, y: isSelected ? 0 : size * 0.35)
                .foregroundColor(.yellow)
        }
        .frame(width: size, height: size)
        .onTapGesture {
            withAnimation {
                isSelected.toggle()
            }
        }
    }
}

@available(iOS 13.0, *)
@available(macOS 10.15, *)
struct MoreVert_Cross_Previews: PreviewProvider {
    static var previews: some View {
        MoreVert_Cross(size: 100, isSelected: .constant(true))
    }
}

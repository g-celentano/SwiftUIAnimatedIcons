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
    public init(isSelected: Binding<Bool>,size: CGFloat? = nil, duration: CGFloat? = nil ) {
        _isSelected = isSelected
        
        self.size = size ?? 40.0
        self.duration = duration ?? 0.1
        
    }

    @Binding private var isSelected: Bool
    @State private var size: CGFloat
    @State private var duration: CGFloat
    @State private var moreOpacity: CGFloat = 1.0
    public var body: some View {
        ZStack {
            Circle()
                .frame(width: size * 0.3)
                .offset(x: 0, y: isSelected ? 0 : -size * 0.35)
                .opacity(moreOpacity)
            ZStack{
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
                
            Circle()
                .frame(width: size * 0.3)
                .offset(x: 0, y: isSelected ? 0 : size * 0.35)
                .opacity(moreOpacity)
        }
        .frame(width: size, height: size)
        .onTapGesture {
            
            withAnimation(.linear(duration: duration)){
                isSelected.toggle()
                DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
                    withAnimation {
                        moreOpacity = isSelected ? 0.0 : 1.0
                    }
                }
            }
        }
    }
}

@available(iOS 13.0, *)
@available(macOS 10.15, *)
struct MoreVert_Cross_Previews: PreviewProvider {
    static var previews: some View {
        MoreVert_Cross(isSelected: .constant(true), size: 100)
    }
}

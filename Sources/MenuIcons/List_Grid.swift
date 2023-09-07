//
//  SwiftUIView.swift
//
//
//  Created by Gaetano Celentano on 07/09/23.
//

import SwiftUI

/// List-Gird
/// Parameters list:
/// - **isList**: state handle value
/// - **size**: icon size
/// - **color**: icon color
/// - **duration**: animation duration

@available(iOS 13.0, *)
@available(macOS 10.15, *)
public struct List_Grid: View {
    public init(_ isList: Binding<Bool>, size: CGFloat = 24.0, color: Color = .black, duration: CGFloat = 0.35) {
        _isList = isList
        self.size = size
        self.color = color
        self.duration = duration

        self.gridCols = isList.wrappedValue ? 2 : 3
    }

    @Binding private var isList: Bool
    @State private var size: CGFloat
    @State private var color: Color
    @State private var duration: CGFloat

    @State private var gridCols: Int

    public var body: some View {
        ZStack {
            // MARK: Left dots to grid elements

            // list top left rectangle - grid top left rectangle
            Rectangle()
                .frame(width: isList ? size * 0.1 : size * 0.3, height: isList ? size * 0.1 : size * 0.475)
                .offset(x: -size * 0.33, y: isList ? -size * 0.15 : -size * 0.25)
            // list center left rectangle - grid center top rectangle
            Rectangle()
                .frame(width: isList ? size * 0.1 : size * 0.3, height: isList ? size * 0.1 : size * 0.475)
                .offset(x: isList ? -size * 0.33 : 0, y: isList ? 0 : -size * 0.25)
            // list bottom left rectangle - grid bottom left rectangle
            Rectangle()
                .frame(width: isList ? size * 0.1 : size * 0.3, height: isList ? size * 0.1 : size * 0.475)
                .offset(x: -size * 0.33, y: isList ? size * 0.15 : size * 0.25)

            // MARK: Right long rectangles to grid elements

            // list top right rectangle - grid top right rectangle
            Rectangle()
                .frame(width: isList ? size * 0.5 : size * 0.3, height: isList ? size * 0.1 : size * 0.475)
                .offset(x: isList ? size * 0.05 : size * 0.33, y: isList ? -size * 0.15 : -size * 0.25)
            // list center right rectangle - grid center bottom rectangle
            Rectangle()
                .frame(width: isList ? size * 0.5 : size * 0.3, height: isList ? size * 0.1 : size * 0.475)
                .offset(x: isList ? size * 0.05 : 0, y: isList ? 0 : size * 0.25)
            // list bottom right rectangle - grid bottom right rectangle
            Rectangle()
                .frame(width: isList ? size * 0.5 : size * 0.3, height: isList ? size * 0.1 : size * 0.475)
                .offset(x: isList ? size * 0.05 : size * 0.33, y: isList ? size * 0.15 : size * 0.25)
        }
        .frame(width: size, height: size)
        .onTapGesture {
            withAnimation(.linear(duration: duration)) {
                isList.toggle()
            }
        }
    }
}

@available(iOS 13.0, *)
@available(macOS 10.15, *)
struct List_Grid_Previews: PreviewProvider {
    static var previews: some View {
        List_Grid(.constant(true), size: 100)
    }
}

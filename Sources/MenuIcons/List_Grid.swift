//
//  SwiftUIView.swift
//
//
//  Created by Gaetano Celentano on 07/09/23.
//

import SwiftUI

public enum GridLayout {
    case TwoByTwo
    case ThreeByTwo
}

/// List-Gird
/// Parameters list:
/// - **isList**: state handle value
/// - **size**: icon size
/// - **color**: icon color
/// - **duration**: animation duration

@available(iOS 13.0, *)
@available(macOS 10.15, *)
public struct List_Grid: View {
    public init(_ isList: Binding<Bool>, size: CGFloat = 24.0, color: Color = .black, duration: CGFloat = 0.35, gridLayout: GridLayout = .TwoByTwo) {
        _isList = isList
        self.size = size
        self.color = color
        self.duration = duration
        self.gridLayout = gridLayout

        var offs = [CGPoint](repeating: .zero, count: 6)
        if isList.wrappedValue {
            offs[0] = CGPoint(x: -size * 0.35, y: -size * 0.2)
            offs[1] = CGPoint(x: -size * 0.35, y: 0)
            offs[2] = CGPoint(x: -size * 0.35, y: size * 0.2)
            offs[3] = CGPoint(x: size * 0.11, y: -size * 0.2)
            offs[4] = CGPoint(x: size * 0.11, y: 0)
            offs[5] = CGPoint(x: size * 0.11, y: size * 0.2)
        } else {
            if gridLayout == .TwoByTwo {
                offs[0] = CGPoint(x: -size * 0.15, y: -size * 0.2)
                offs[1] = CGPoint(x: -size * 0.15, y: -size * 0.2)
                offs[2] = CGPoint(x: -size * 0.15, y: size * 0.2)
                offs[3] = CGPoint(x: size * 0.15, y: -size * 0.2)
                offs[4] = CGPoint(x: size * 0.15, y: -size * 0.2)
                offs[5] = CGPoint(x: size * 0.15, y: size * 0.2)
            } else {
                offs[0] = CGPoint(x: -size * 0.3, y: -size * 0.2)
                offs[1] = CGPoint(x: 0, y: -size * 0.2)
                offs[2] = CGPoint(x: -size * 0.3, y: size * 0.2)
                offs[3] = CGPoint(x: size * 0.3, y: -size * 0.2)
                offs[4] = CGPoint(x: 0, y: size * 0.2)
                offs[5] = CGPoint(x: size * 0.3, y: size * 0.2)
            }
        }

        self.offsets = offs
    }

    @Binding private var isList: Bool
    @State private var size: CGFloat
    @State private var color: Color
    @State private var duration: CGFloat
    @State private var gridLayout: GridLayout

    @State private var offsets: [CGPoint]

    public var body: some View {
        ZStack {
            // left list dots to grid elements
            Rectangle()
                .frame(width: isList ? size * 0.15 : size * 0.275, height: isList ? size * 0.15 : size * 0.35)
                .offset(x: offsets[0].x, y: offsets[0].y)
            Rectangle()
                .frame(width: isList ? size * 0.15 : size * 0.275, height: isList ? size * 0.15 : size * 0.35)
                .offset(x: offsets[1].x, y: offsets[1].y)
            Rectangle()
                .frame(width: isList ? size * 0.15 : size * 0.275, height: isList ? size * 0.15 : size * 0.35)
                .offset(x: offsets[2].x, y: offsets[2].y)
            // right list lines to grid elements
            Rectangle()
                .frame(width: isList ? size * 0.65 : size * 0.275, height: isList ? size * 0.15 : size * 0.35)
                .offset(x: offsets[3].x, y: offsets[3].y)
            Rectangle()
                .frame(width: isList ? size * 0.65 : size * 0.275, height: isList ? size * 0.15 : size * 0.35)
                .offset(x: offsets[4].x, y: offsets[4].y)
            Rectangle()
                .frame(width: isList ? size * 0.65 : size * 0.275, height: isList ? size * 0.15 : size * 0.35)
                .offset(x: offsets[5].x, y: offsets[5].y)
        }
        .frame(width: size, height: size)
        .foregroundColor(color)
        .onTapGesture(perform: updateOffsets)
    }

    private func updateOffsets() {
        if isList {
            withAnimation(.linear(duration: duration * 0.35)) {
                offsets[0] = .zero
                offsets[1] = .zero
                offsets[2] = .zero
                offsets[3] = .zero
                offsets[4] = .zero
                offsets[5] = .zero
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + duration * 0.35) {
                withAnimation(.linear(duration: duration * 0.2)) {
                    isList = false
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + duration * 0.2) {
                    withAnimation(.linear(duration: duration * 0.35)) {
                        if gridLayout == .TwoByTwo {
                            offsets[0] = CGPoint(x: -size * 0.15, y: -size * 0.2)
                            offsets[1] = CGPoint(x: -size * 0.15, y: -size * 0.2)
                            offsets[2] = CGPoint(x: -size * 0.15, y: size * 0.2)
                            offsets[3] = CGPoint(x: size * 0.15, y: -size * 0.2)
                            offsets[4] = CGPoint(x: size * 0.15, y: -size * 0.2)
                            offsets[5] = CGPoint(x: size * 0.15, y: size * 0.2)
                        } else {
                            offsets[0] = CGPoint(x: -size * 0.3, y: -size * 0.2)
                            offsets[1] = CGPoint(x: 0, y: -size * 0.2)
                            offsets[2] = CGPoint(x: -size * 0.3, y: size * 0.2)
                            offsets[3] = CGPoint(x: size * 0.3, y: -size * 0.2)
                            offsets[4] = CGPoint(x: 0, y: size * 0.2)
                            offsets[5] = CGPoint(x: size * 0.3, y: size * 0.2)
                        }
                    }
                }
            }
        } else {
            withAnimation(.linear(duration: duration * 0.35)) {
                offsets[0] = .zero
                offsets[1] = .zero
                offsets[2] = .zero
                offsets[3] = .zero
                offsets[4] = .zero
                offsets[5] = .zero
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + duration * 0.35) {
                withAnimation(.linear(duration: duration * 0.2)) {
                    isList = true
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + duration * 0.2) {
                    withAnimation(.linear(duration: duration * 0.35)) {
                        offsets[0] = CGPoint(x: -size * 0.35, y: -size * 0.2)
                        offsets[1] = CGPoint(x: -size * 0.35, y: 0)
                        offsets[2] = CGPoint(x: -size * 0.35, y: size * 0.2)
                        offsets[3] = CGPoint(x: size * 0.11, y: -size * 0.2)
                        offsets[4] = CGPoint(x: size * 0.11, y: 0)
                        offsets[5] = CGPoint(x: size * 0.11, y: size * 0.2)
                    }
                }
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

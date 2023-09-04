//
//  SwiftUIView.swift
//
//
//  Created by Gaetano Celentano on 31/08/23.
//

import SwiftUI

/// GrowingRects
/// Parameters List:
/// - **size**: icon size
/// - **color**: icon color
/// - **duration**: growing animation duration, in **seconds**
/// - **delay**: delay between growing animations, in **seconds**

@available(iOS 13.0, *)
@available(iOS 10.15, *)
public struct GrowingRects: View {
    public init(size: CGFloat = 48.0, color: Color = .black, duration: CGFloat = 0.225, delay: CGFloat = 0.075) {
        self.size = size
        self.color = color
        self.duration = duration
        self.delay = delay

        var heightsFill: [CGFloat] = []
        for _ in 0 ..< 5 {
            heightsFill.append(size * 0.5)
        }
        self.heights = heightsFill
    }

    @State var size: CGFloat
    @State var color: Color
    @State var duration: CGFloat
    @State var delay: CGFloat

    @State var heights: [CGFloat]

    public var body: some View {
        ZStack {
            ForEach(0 ..< 5, id: \.self) { index in
                Rectangle()
                    .frame(width: self.size * 0.15, height: self.heights[index])
                    .offset(x: size / 5.0 * CGFloat(index))
                    .animation(.linear(duration: duration).delay(duration + delay).repeatForever().delay(0.15 * Double(index)), value: heights[index])
            }
        }
        .frame(width: self.size, height: self.size, alignment: .leading)
        .foregroundColor(self.color)
        .onAppear {
            for i in 0..<heights.count {
                heights[i] = size
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
                for i in 0..<heights.count {
                    heights[i] = size * 0.5
                }
            }
        }
    }
}

@available(iOS 13.0, *)
@available(iOS 10.15, *)
struct GrowingRects_Previews: PreviewProvider {
    static var previews: some View {
        GrowingRects()
    }
}

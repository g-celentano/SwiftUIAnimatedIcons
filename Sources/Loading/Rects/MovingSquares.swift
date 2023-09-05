//
//  SwiftUIView.swift
//
//
//  Created by Gaetano Celentano on 04/09/23.
//

import SwiftUI

public enum SquareNumber: Int {
    case Two = 2
    case Three = 3
}


/// MovingSquares
/// Parameters list:
/// - **cornerRadius**: percentage amount of the corner radius of a single square, **(0 -> square, >0.5 -> circle)**
/// - **size**: icon size
/// - **color**: icon color
/// - **duration**: single movement duration
/// - **squareNumbers**: numbers of the squares present in the icon (**cases**: Two, Three)

@available(iOS 13.0, *)
@available(macOS 10.15, *)
public struct MovingSquares: View {
    public init(cornerRadius: CGFloat = 0.1, size: CGFloat = 48.0, color: Color = .black, duration: CGFloat = 0.25, squareNumbers: SquareNumber = .Two) {
        if cornerRadius < 0 {
            self.cornerRadius = 0.0
        } else if cornerRadius > 1.0 {
            self.cornerRadius = 1.0
        } else {
            self.cornerRadius = cornerRadius
        }
        self.size = size
        self.color = color
        self.duration = duration

        var offsets: [CGSize] = []

        switch squareNumbers {
        case .Two:
            offsets.append(CGSize(width: 0, height: -size * 0.25))
            offsets.append(CGSize(width: size * 0.5, height: size * 0.25))
        case .Three:
            offsets.append(CGSize(width: 0, height: -size * 0.25))
            offsets.append(CGSize(width: 0, height: size * 0.25))
            offsets.append(CGSize(width: size * 0.5, height: size * 0.25))
        }

        self.offsets = offsets
    }

    @State private var size: CGFloat
    @State private var color: Color
    @State private var duration: CGFloat
    @State private var cornerRadius: CGFloat
    @State private var offsets: [CGSize]

    public var body: some View {
        ZStack {
            let squareSize = size * 0.475
            let delay = offsets.count == 2 ? duration * 3 : duration * 5
            ForEach(0 ..< offsets.count, id: \.self) { offsetIndex in
                RoundedRectangle(cornerRadius: squareSize * cornerRadius)
                    .frame(width: squareSize, height: squareSize)
                    .offset(offsets[offsetIndex])
                    .animation(.linear(duration: duration).delay(delay).repeatForever().delay(0.1 * Double(offsetIndex)), value: offsets[offsetIndex])
            }
        }
        .frame(width: size, height: size)
        .foregroundColor(color)
        .onAppear {
            switch offsets.count {
            case 2 :
                offsets[0] = (CGSize(width: size * 0.5, height: -size * 0.25))
                offsets[1] = (CGSize(width: 0, height: size * 0.25))
                DispatchQueue.main.asyncAfter(deadline: .now() + duration * 1.3) {
                    offsets[0] = (CGSize(width: size * 0.5, height: size * 0.25))
                    offsets[1] = (CGSize(width: 0, height: -size * 0.25))
                    DispatchQueue.main.asyncAfter(deadline: .now() + duration * 1.5) {
                        offsets[0] = (CGSize(width: 0, height: size * 0.25))
                        offsets[1] = (CGSize(width: size * 0.5, height: -size * 0.25))
                    }
                }
                
            case 3 :
                offsets[0] = (CGSize(width: size * 0.5, height: -size * 0.25))
                offsets[1] = (CGSize(width: 0, height: -size * 0.25))
                offsets[2] = (CGSize(width: 0, height: size * 0.25))
                DispatchQueue.main.asyncAfter(deadline: .now() + duration * 2.1) {
                    offsets[0] = (CGSize(width: size * 0.5, height: size * 0.25))
                    offsets[1] = (CGSize(width: size * 0.5, height: -size * 0.25))
                    offsets[2] = (CGSize(width: 0, height: -size * 0.25))
                    DispatchQueue.main.asyncAfter(deadline: .now() + duration * 2.2) {
                        offsets[0] = (CGSize(width: 0, height: size * 0.25))
                        offsets[1] = (CGSize(width: size * 0.5, height: size * 0.25))
                        offsets[2] = (CGSize(width: size * 0.5, height: -size * 0.25))
                    }
                }
            default:
                return
            }
        }
    }
}

@available(iOS 13.0, *)
@available(macOS 10.15, *)
struct MovingSquares_Previews: PreviewProvider {
    static var previews: some View {
        MovingSquares(squareNumbers: .Three)
    }
}

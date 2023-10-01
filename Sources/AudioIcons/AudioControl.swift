//
//  SwiftUIView.swift
//
//
//  Created by Gaetano Celentano on 29/09/23.
//

import SwiftUI

/// **AudioControl**
///
/// - **size**: icon size
/// - **color**: icon color
/// - **duration**: animation duration
/// - **isNextButton**: flag indicating the direction of the button

@available(iOS 13.0, *)
@available(macOS 10.15, *)
public struct AudioControl: View {
    public init(size: CGFloat = 24.0, duration: CGFloat = 0.35, color: Color = .black, isNextButton: Bool = true, isRounded: Bool = true) {
        self.size = size
        self.color = color
        self.isNextButton = isNextButton
        self.duration = duration
        self.isRounded = isRounded

        self.sizes = isNextButton ? [0.0, 0.5, 0.5] : [0.5, 0.5, 0.0]
    }

    @State private var size: CGFloat
    @State private var color: Color
    @State private var isNextButton: Bool
    @State private var duration: CGFloat
    @State private var isRounded: Bool

    @State private var sizes: [CGFloat]

    @State private var tappable: Bool = true

    public var body: some View {
        HStack(spacing: 1) {
            AudioControlPieceShape(isRounded: self.isRounded)
                .frame(width: size * sizes[0], height: size * sizes[0])
                .rotationEffect(.degrees(isNextButton ? 0.0 : 180.0))
            AudioControlPieceShape(isRounded: self.isRounded)
                .frame(width: size * sizes[1], height: size * sizes[1])
                .rotationEffect(.degrees(isNextButton ? 0.0 : 180.0))
            AudioControlPieceShape(isRounded: self.isRounded)
                .frame(width: size * sizes[2], height: size * sizes[2])
                .rotationEffect(.degrees(isNextButton ? 0.0 : 180.0))
        }
        .frame(width: size, height: size, alignment: isNextButton ? .trailing : .leading)
        .foregroundColor(color)
        .onTapGesture {
            if tappable {
                tappable = false
                withAnimation(.linear(duration: duration)) {
                    sizes[2] = isNextButton ? 0.0 : 0.5
                    sizes[0] = isNextButton ? 0.5 : 0.0
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + duration * 1.1) {
                    sizes[2] = isNextButton ? 0.5 : 0.0
                    sizes[0] = isNextButton ? 0.0 : 0.5
                    tappable = true
                }
            }
        }
    }
}

@available(iOS 13.0, *)
@available(macOS 10.15, *)
private struct AudioControlPieceShape: Shape {
    let isRounded: Bool

    func path(in rect: CGRect) -> Path {
        var path = Path()

        if isRounded {
            /*path.move(to: CGPoint(x: rect.width * 0.1, y: rect.height * 0.05))
            path.addLine(to: CGPoint(x: rect.width * 0.95, y: rect.height * 0.45))
            path.addCurve(to: CGPoint(x: rect.width * 0.95, y: rect.height * 0.55), control1: CGPoint(x: rect.width, y: rect.height * 0.475), control2: CGPoint(x: rect.width, y: rect.height
                    * 0.525))
            path.addLine(to: CGPoint(x: rect.width * 0.1, y: rect.height * 0.95))
            path.addCurve(to: CGPoint(x: rect.minX, y: rect.height * 0.9), control1: CGPoint(x: 0, y: rect.height), control2: CGPoint(x: 0, y: rect.height * 0.9))
            path.addLine(to: CGPoint(x: 0, y: rect.height * 0.2))
            path.addCurve(to: CGPoint(x: rect.width * 0.1, y: rect.height * 0.05), control1: CGPoint(x: 0, y: rect.height * 0.05), control2: CGPoint(x: 0, y: 0))
            path.closeSubpath()*/
            let width = rect.size.width
            let height = rect.size.height
            path.move(to: CGPoint(x: 0, y: 0.1144676364*height))
            path.addCurve(to: CGPoint(x: 0, y: 0.8855322049*height), control1: CGPoint(x: 0, y: 0.1845654158*height), control2: CGPoint(x: 0, y: 0.8154353614*height))
            path.addCurve(to: CGPoint(x: 0.1818181818*width, y: 0.9906773699*height), control1: CGPoint(x: 0, y: 0.9556290484*height), control2: CGPoint(x: 0.0727272727*width, y: 1.0257256914*height))
            path.addCurve(to: CGPoint(x: 0.9454545455*width, y: 0.6401935534*height), control1: CGPoint(x: 0.2909090909*width, y: 0.9556290484*height), control2: CGPoint(x: 0.8727272727*width, y: 0.71029033*height))
            path.addCurve(to: CGPoint(x: 0.9454545455*width, y: 0.4299032233*height), control1: CGPoint(x: 1.0181818182*width, y: 0.5700967767*height), control2: CGPoint(x: 1.0181818182*width, y: 0.5000000668*height))
            path.addCurve(to: CGPoint(x: 0.1818181818*width, y: 0.0093224745*height), control1: CGPoint(x: 0.8727272727*width, y: 0.3598063798*height), control2: CGPoint(x: 0.2909090909*width, y: 0.0443708628*height))
            path.addCurve(to: CGPoint(x: 0, y: 0.1144676364*height), control1: CGPoint(x: 0.0727272727*width, y: -0.0257259139*height), control2: CGPoint(x: 0, y: 0.0443698569*height))
            path.closeSubpath()
        } else {
            path.move(to: .zero)
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
            path.closeSubpath()
        }

        return path
    }
}

@available(iOS 13.0, *)
@available(macOS 10.15, *)
struct AudioControl_Previews: PreviewProvider {
    static var previews: some View {
        AudioControl(size: 300)
    }
}

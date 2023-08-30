//
//  File.swift
//
//
//  Created by Gaetano Celentano on 29/08/23.
//

import Foundation
import SwiftUI

public enum DotShape {
    case circle
    case rectangle
    case roundedRectangle
    case triangle
    case star
    
}


@available (iOS 13.0, *)
@available (macOS 10.15, *)
public struct ActualDotShape: Shape {
    let shapeToDraw: DotShape

    public func path(in rect: CGRect) -> Path {
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let w = rect.width
        let h = rect.height

        switch shapeToDraw {
        case .circle:
            return Path { path in
                path.addArc(center: center, radius: w * 0.5, startAngle: .degrees(0.0), endAngle: .degrees(360.0), clockwise: false)
            }
        case .rectangle:
            return Path { path in
                path.addRect(CGRect(origin: .zero, size: CGSize(width: w, height: h)))
            }
        case .roundedRectangle:
            return Path { path in
                path.addRoundedRect(in: CGRect(origin: .zero, size: CGSize(width: w, height: h)), cornerSize: CGSize(width: w * 0.2, height: h * 0.2))
            }
        case .triangle:
            return Path { path in
                path.move(to: CGPoint(x: rect.midX, y: rect.minY))
                path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
                path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
                path.closeSubpath()
            }
        case .star:

            // MARK: adapted code from https://www.hackingwithswift.com/quick-start/swiftui/how-to-draw-polygons-and-stars

            var path = Path()
            var currentAngle = -CGFloat.pi / 2
            let angleAdjustment = CGFloat.pi * 2 / 10 // 10 for star with 5 corners
            // figure out how much we need to move X/Y for the inner points of the star
            let innerX = center.x * 0.45
            let innerY = center.y * 0.45
            path.move(to: CGPoint(x: center.x * cos(currentAngle), y: center.y * sin(currentAngle)))
            var bottomEdge: Double = 0
            // loop over all our points/inner points
            for corner in 0 ..< 10 {
                // figure out the location of this point
                let sinAngle = sin(currentAngle)
                let cosAngle = cos(currentAngle)
                let bottom: Double

                // if we're a multiple of 2 we are drawing the outer edge of the star
                if corner.isMultiple(of: 2) {
                    // store this Y position
                    bottom = center.y * sinAngle

                    // …and add a line to there
                    path.addLine(to: CGPoint(x: center.x * cosAngle, y: bottom))
                } else {
                    // we're not a multiple of 2, which means we're drawing an inner point

                    // store this Y position
                    bottom = innerY * sinAngle

                    // …and add a line to there
                    path.addLine(to: CGPoint(x: innerX * cosAngle, y: bottom))
                }

                // if this new bottom point is our lowest, stash it away for later
                if bottom > bottomEdge {
                    bottomEdge = bottom
                }

                // move on to the next corner
                currentAngle += angleAdjustment
            }
            let unusedSpace = (rect.height / 2 - bottomEdge) / 2

            // create and apply a transform that moves our path down by that amount, centering the shape vertically
            let transform = CGAffineTransform(translationX: center.x, y: center.y + unusedSpace)
            return path.applying(transform)
        }
    }
}

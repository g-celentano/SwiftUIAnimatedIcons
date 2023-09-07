//
//  ContentView.swift
//  AnimatedIconsExample
//
//  Created by Gaetano Celentano on 22/08/23.
//

import AnimatedIcons
import SwiftUI

struct ContentView: View {
    @State var onScreenState: Bool = false
    @State var availableIcons = ["MoreVert_Cross", "MoreHor_Cross", "Add_Cross", "Burger_Cross", "Chevron Rotation", "List_Grid", "Sun_Moon", "LightBulb", "Loading Spinner", "Loading Dots", "Loading Rects"]
    @State var selectedIcons = "MoreVert_Cross"
    var body: some View {
        VStack {
            Picker(selection: $selectedIcons) {
                ForEach(availableIcons, id: \.self) { icon in
                    Text("\(icon)")
                }
            } label: {
                Text("AnimatedIcons")
            }
            Spacer()
            switch selectedIcons {
            case "MoreVert_Cross":
                MoreVert_Cross($onScreenState, duration: 0.75)
                Text(onScreenState ? "cross" : "more vertical")
            case "MoreHor_Cross":
                MoreHor_Cross($onScreenState, size: 150)
                Text(onScreenState ? "cross" : "more horizontal")
            case "Add_Cross":
                Add_Cross($onScreenState, size: 80, plusColor: .red, crossColor: .blue)
                Text(onScreenState ? "cross" : "plus")
            case "Burger_Cross":
                BurgerMenu_Cross($onScreenState, size: 200, isRounded: false)
                Text(onScreenState ? "cross" : "burger menu")
            case "Chevron Rotation":
                ChevronRotation($onScreenState, from: .right, to: .bottom, lineCaps: .rounded)
                Text(onScreenState ? "to" : "from")
            case "List_Grid":
                List_Grid($onScreenState, size: 100)
                Text(onScreenState ? "list" : "grid")
            case "Sun_Moon":
                Sun_Moon($onScreenState, size: 200)
                Text(onScreenState ? "isSun" : "isMoon")
            case "LightBulb":
                LightBulb($onScreenState, size: 200)
                Text(onScreenState ? "lights on" : "lights off")
                
                
            case "Loading Spinner":
                ScrollView {
                    LazyVGrid(columns: [GridItem(), GridItem()]) {
                        VStack {
                            Spinner(loadingAmount: 270, color: .green, rotationDuration: 1.2)
                            Spinner()
                            Spinner(color: .gray, ringBackgroundColor: .gray.opacity(0.3), rotationDuration: 0.5)

                            Text("Loading Spinner")
                        }
                        VStack {
                            GrowingDotsSpinner(size: 50, color: .red)
                            GrowingDotsSpinner(minDotScale: 0.1, maxDotScale: 1.5, dotDistance: 60)
                            GrowingDotsSpinner(dotDistance: 20)

                            Text("Growing Dots Loading Spinner")
                        }
                        VStack {
                            GrowingSpinner(size: 100)
                            GrowingSpinner(spinnerColor: .red, spinnerBgColor: .blue)
                            GrowingSpinner(rotationDuration: 1.2)

                            Text("Growing Loading Spinner")
                        }
                        VStack {
                            DisappearingDotsSpinner(size: 100)
                            DisappearingDotsSpinner(color: .yellow)
                            DisappearingDotsSpinner(dotsDistance: 45)

                            Text("Growing Dots Loading Spinner")
                        }
                    }
                }
            case "Loading Dots":
                ScrollView {
                    LazyVGrid(columns: [GridItem(), GridItem()]) {
                        VStack {
                            BouncyDots(size: 80, color: .red)
                            BouncyDots(dotsShape: .triangle)
                            BouncyDots(color: .yellow, dotsShape: .star)
                            Text("Bouncy Loading Dots")
                        }
                        VStack {
                            DisappearingDots(size: 80, color: .red)
                            DisappearingDots(dotsShape: .triangle)
                            DisappearingDots(color: .yellow, dotsShape: .star)
                            Text("Disappearing Loading Dots")
                        }
                        VStack {
                            MovingDots(size: 80, color: .red, animationDuration: 1.0, animationDelay: 0.0)
                            MovingDots(dotsShape: .triangle, animationDelay: 0.5)
                            MovingDots(color: .yellow, dotsShape: .star)
                            Text("Moving Loading Dots")
                        }
                        VStack {
                            RotatingDots(size: 80, color: .red, animationDuration: 0.2, animationDelay: 1.0)
                            RotatingDots(dotsShape: .triangle)
                            RotatingDots(color: .yellow, dotsShape: .star, animationDuration: 2.0)
                            Text("Rotating Loading Dots")
                        }
                        VStack {
                            GrowingDots(size: 80, color: .red, duration: 2.0)
                            GrowingDots(dotsShape: .triangle, fromLeftToRight: false)
                            GrowingDots(color: .yellow, dotsShape: .star)
                            Text("Rotating Loading Dots")
                        }
                    }
                }
            case "Loading Rects":
                ScrollView {
                    LazyVGrid(columns: [GridItem(), GridItem()]) {
                        VStack {
                            MovingSquares(size: 80, color: .red)
                            MovingSquares(cornerRadius: 0.75, duration: 0.5)
                            MovingSquares(color: .yellow, squareNumbers: .Three)
                            Text("Moving Loading Squares")
                        }
                        VStack {
                            PulsingSquares(size: 80, color: .red)
                            PulsingSquares(cornerRadius: 0.75, duration: 0.5)
                            PulsingSquares(color: .yellow, delay: 0.25)
                            Text("Pulsing Loading Squares")
                        }
                        VStack {
                            GrowingRects(size: 100, duration: 1.5, delay: 0.0)
                            GrowingRects(delay: 0.5)
                            GrowingRects(size: 150, delay: 1.25)
                            Text("Growing Loading Rects")
                        }
                        VStack {
                            DisappearingRects(color: .red, duration: 1.5)
                            DisappearingRects(size: 150, delay: 0.25)
                            DisappearingRects()
                            Text("Rotating Loading Dots")
                        }
                    }
                }

            default:
                Text("Select an icon")
            }
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .padding()
        .onChange(of: selectedIcons) { _ in
            onScreenState = false
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

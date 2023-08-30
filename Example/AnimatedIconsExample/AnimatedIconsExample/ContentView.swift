//
//  ContentView.swift
//  AnimatedIconsExample
//
//  Created by Gaetano Celentano on 22/08/23.
//

import AnimatedIcons
import SwiftUI

/**
 MoreVert_Cross(isSelected: $isSelectedVertical, duration: 0.75)
 Text(isSelectedVertical ? "cross" : "more vertical")
 MoreHor_Cross(isSelected: $isSelectedHorizontal, size: 150)
 Text(isSelectedHorizontal ? "cross" : "more horizontal")
 Add_Cross(isSelected: $isSelectedAdd, size: 80, plusColor: .red, crossColor: .blue)
 Text(isSelectedAdd ? "cross" : "plus")
 BurgerMenu_Cross(menuState: $isMenuOpen, isRounded: true)
 Text(isMenuOpen ? "cross" : "burger menu")
 ChevronRotation(isSelected: $isChevronSelected, from: .right, to: .bottom, lineCaps: .pointy)
 Text(isChevronSelected ? "to" : "from")
 */

struct ContentView: View {
    @State var onScreenState: Bool = false
    @State var availableIcons = ["MoreVert_Cross", "MoreHor_Cross", "Add_Cross", "Burger_Cross", "Chevron Rotation", "Sun_Moon", "Loading Spinner", "Loading Dots"]
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
            case "Sun_Moon":
                Sun_Moon($onScreenState, size: 200)
                Text(onScreenState ? "isSun" : "isMoon")
            case "Loading Spinner":
                VStack {
                    Spinner(loadingAmount: 270, color: .green, rotationDuration: 1.2)
                    Spinner()
                    Spinner(color: .gray, ringBackgroundColor: .gray.opacity(0.3), rotationDuration: 0.5)
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

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
                    LoadingSpinner(loadingAmount: 270, color: .green, rotationDuration: 1.2)
                    LoadingSpinner()
                    LoadingSpinner(color: .gray, ringBackgroundColor: .gray.opacity(0.3), rotationDuration: 0.5)
                }
            case "Loading Dots":
                ScrollView {
                    LazyVGrid(columns: [GridItem(), GridItem()]) {
                        VStack {
                            BouncyLoadingDots(size: 80, color: .red)
                            BouncyLoadingDots(dotsShape: .triangle)
                            BouncyLoadingDots(color: .yellow, dotsShape: .star)
                            Text("Bouncy Loading Dots")
                        }
                        VStack {
                            DisappearingLoadingDots(size: 80, color: .red)
                            DisappearingLoadingDots(dotsShape: .triangle)
                            DisappearingLoadingDots(color: .yellow, dotsShape: .star)
                            Text("Disappearing Loading Dots")
                        }
                        VStack {
                            MovingLoadingDots(size: 80, color: .red)
                            MovingLoadingDots(dotsShape: .triangle)
                            MovingLoadingDots(color: .yellow, dotsShape: .star)
                            Text("Moving Loading Dots")
                        }
                        VStack {
                            RotatingLoadingDots(size: 80, color: .red)
                            RotatingLoadingDots(dotsShape: .triangle)
                            RotatingLoadingDots(color: .yellow, dotsShape: .star)
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

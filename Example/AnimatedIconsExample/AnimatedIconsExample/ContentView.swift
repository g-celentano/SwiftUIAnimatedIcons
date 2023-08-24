//
//  ContentView.swift
//  AnimatedIconsExample
//
//  Created by Gaetano Celentano on 22/08/23.
//

import AnimatedIcons
import SwiftUI

struct ContentView: View {
    @State var isSelectedVertical: Bool = false
    @State var isSelectedHorizontal: Bool = false
    @State var isSelectedAdd: Bool = false
    @State var isMenuOpen: Bool = false
    @State var isChevronSelected: Bool = false
    var body: some View {
        VStack {
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
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

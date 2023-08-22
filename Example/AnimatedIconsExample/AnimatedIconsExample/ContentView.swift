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
    var body: some View {
        VStack {
            MoreVert_Cross(isSelected: $isSelectedVertical, firstColor: .blue, secondColor: .red, thirdColor: .yellow, crossColor: .green)
            Text(isSelectedVertical ? "cross" : "more vertical")
            MoreHor_Cross(isSelected: $isSelectedHorizontal, firstColor: .brown, secondColor: .indigo, thirdColor: .purple)
            Text(isSelectedHorizontal ? "cross" : "more horizontal")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

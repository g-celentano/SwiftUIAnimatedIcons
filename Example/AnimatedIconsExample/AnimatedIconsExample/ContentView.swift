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
            MoreVert_Cross(isSelected: $isSelectedVertical, duration: 0.75)
            Text(isSelectedVertical ? "cross" : "more vertical")
            MoreHor_Cross(isSelected: $isSelectedHorizontal, size: 150, colors: [.red, .blue, nil, .indigo])
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

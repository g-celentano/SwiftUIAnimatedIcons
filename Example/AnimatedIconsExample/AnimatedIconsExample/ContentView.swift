//
//  ContentView.swift
//  AnimatedIconsExample
//
//  Created by Gaetano Celentano on 22/08/23.
//

import AnimatedIcons
import SwiftUI

struct ContentView: View {
    @State var isSelected: Bool = false
    var body: some View {
        VStack {
            MoreVert_Cross(isSelected: $isSelected, firstColor: .blue, secondColor: .red, thirdColor: .yellow, crossColor: .green)
            Text(isSelected ? "cross" : "more vert")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

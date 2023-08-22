//
//  ContentView.swift
//  AnimatedIconsExample
//
//  Created by Gaetano Celentano on 22/08/23.
//

import SwiftUI
import AnimatedIcons

struct ContentView: View {
    @State var isSelected : Bool = false
    var body: some View {
        VStack {
            MoreVert_Cross(isSelected: $isSelected)
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

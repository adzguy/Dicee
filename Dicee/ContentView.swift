//
//  ContentView.swift
//  Dicee
//
//  Created by Davron on 4/13/20.
//  Copyright © 2020 Davron. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var selectedView = 0
    @ObservedObject var results = Results()
    
    var body: some View {
        TabView(selection: $selectedView) {
            DiceView()
                .tabItem {
                    Image(systemName: "hand.draw")
                    Text("Roll Dice")
            }.tag(0)
            
            ResultView(results: results)
                .tabItem {
                    Image(systemName: "r.square")
                    Text("Result")
            }.tag(1)
        }.environmentObject(results)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

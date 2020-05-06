//
//  DiceView.swift
//  Dicee
//
//  Created by Davron on 4/13/20.
//  Copyright © 2020 Davron. All rights reserved.
//

import SwiftUI

struct DiceView: View {
    @EnvironmentObject var results: Results
    @State private var one = Int.random(in: 1..<7)
    @State private var two = Int.random(in: 1..<7)
    
    var body: some View {
        VStack {
            Spacer()
            HStack{
                Image("Dice\(one)")
                Image("Dice\(two)")
            }
            Spacer()
            Button(action: {
                // action
                self.one = Int.random(in: 1..<7)
                self.two = Int.random(in: 1..<7)
                let result = Result()
                result.diceOne = self.one
                result.diceTwo = self.two
                self.results.add(result)
            }, label: {
                Text("Roll")
                    .foregroundColor(.white)
                    .frame(width: 60, height: 40)
                    .background(Color.red)
                    .cornerRadius(10)
                    .shadow(color: .gray, radius: 3, x: 3, y: 3)
            })
            Spacer()
        }
    }
}

//struct DiceView_Previews: PreviewProvider {
//    static var previews: some View {
//        DiceView()
//    }
//}

//
//  Result.swift
//  Dicee
//
//  Created by Davron on 4/22/20.
//  Copyright © 2020 Davron. All rights reserved.
//

import SwiftUI

class Result: Identifiable, Codable {
    
    let id = UUID()
    var diceOne: Int = 2
    var diceTwo: Int = 1

}

class Results: ObservableObject {
    @Published var results: [Result]
    private let saveKey = "SavedPath"
    
    init() {
        // load our saved data
        if let data = UserDefaults.standard.data(forKey: saveKey) {
            if let decoded = try? JSONDecoder().decode([Result].self, from: data) {
                self.results = decoded
                return
            }
        }
        // still here? Use an empty array
        self.results = []
    }
    
    func add(_ result: Result) {
        objectWillChange.send()
        results.append(result)
        save()
    }
    
    func save() {
        if let encoded = try? JSONEncoder().encode(results) {
            UserDefaults.standard.set(encoded, forKey: saveKey)
        }
    }
    
    
}

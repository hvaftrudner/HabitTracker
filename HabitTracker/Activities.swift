//
//  Activities.swift
//  HabitTracker
//
//  Created by Kristoffer Eriksson on 2021-03-18.
//

import Foundation
import SwiftUI

class Activities: ObservableObject {
    
    @Published var activities = [Activity]() {
        didSet {
            let encoder = JSONEncoder()
            
            if let encoded = try? encoder.encode(activities){
                UserDefaults.standard.set(encoded, forKey: "Activities")
            }
        }
    }
    
    init(){
        if let activities = UserDefaults.standard.data(forKey: "Activities"){
            let decoder = JSONDecoder()
            
            if let decoded = try? decoder.decode([Activity].self, from: activities){
                self.activities = decoded
                return
            }
        }
        
        self.activities = []
    }
}

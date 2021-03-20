//
//  AddActivityView.swift
//  HabitTracker
//
//  Created by Kristoffer Eriksson on 2021-03-18.
//

import SwiftUI

struct AddActivityView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @ObservedObject var activities: Activities
    
    @State private var name: String = ""
    @State private var describtion: String = ""
    @State private var count: String = ""
    
    @State private var testCount: Int = 0
    
    var newCount: Int {
        let newValue = Int(count) ?? 0
        
        return newValue
    }
    
    var body: some View {
        NavigationView {
            Form {
                VStack {
                    
                    TextField("Activity", text: $name)
                    
                    TextField("Describtion", text: $describtion)
                    
                    Text("Count: \(testCount)")
                    }
                    
                    Button("+"){
                        self.testCount += 1
                    }
                    Button("Save"){
                        //testSeed
                        let newActivity = Activity(name: self.name, activity: "test", describtion: self.describtion, count: self.testCount)
                        
                        
                        self.activities.activities.insert(newActivity, at: 0)
                        self.presentationMode.wrappedValue.dismiss()
                    }
            }
            .navigationTitle("Add new Activity")
        }
    }
}

struct AddActivityView_Previews: PreviewProvider {
    static var previews: some View {
        AddActivityView(activities: Activities())
    }
}

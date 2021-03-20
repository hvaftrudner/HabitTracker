//
//  ActivityView.swift
//  HabitTracker
//
//  Created by Kristoffer Eriksson on 2021-03-18.
//

import SwiftUI

struct ActivityView: View {
    
    //@EnvironmentObject var newActivity : Activities
    @ObservedObject var activities: Activities
    
    var activity: Activity
    
    
    
    var body: some View {
        NavigationView {
            ZStack{
                
                LinearGradient(gradient: Gradient(colors: [Color.red, Color.orange, Color.yellow]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    
                
                VStack {
                    
                    Text(activity.describtion)
                        .font(.footnote)
                        .padding(60)
                    
                    Text("Completed: \(activity.count) times")
                        .font(.title)
                        .padding(40)
                    
                    Button("Add count"){
                        guard let index = activities.activities.firstIndex(where: {$0.id == activity.id }) else { return }
                        self.activities.activities[index].count += 1
                    }
                    .padding(100)
                    
                }
            }
            .navigationTitle(activity.name)
        }
    }
}

struct ActivityView_Previews: PreviewProvider {
    
    static var activities2 = Activities()
    
    static var previews: some View {
        ActivityView(activities: activities2, activity: activities2.activities[0])
    }
}

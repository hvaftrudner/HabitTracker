//
//  ActivitiesView.swift
//  HabitTracker
//
//  Created by Kristoffer Eriksson on 2021-03-18.
//

import SwiftUI

struct ActivitiesView: View {
    
    @ObservedObject var activities = Activities()
    
    @State private var showingAddActivity: Bool = false
    
    var body: some View {
        NavigationView{
            List{
                ForEach(activities.activities, id: \.id){ activity in
                    
                    NavigationLink(destination: ActivityView(activities: activities,  activity: activity)) {
                        HStack{
                            VStack(){
                                Text(activity.name)
                                    .font(.title2)
                                
                                Text(activity.describtion)
                                    .font(.caption2)
                            }
                            .frame(width: 150, height: 120)
                            //.padding(2)
                            .border(Color.black, width: 1)
                        
                            VStack(alignment: .center) {
                                Text("Days: ")
                                
                                Text("\(activity.count)")
                            }
                            .padding(10)
                            
                        }
                        .padding(5)
                    }
                }
                .onDelete(perform: removeActivity)
            }
            .navigationTitle("Activity List")
            .navigationBarItems(leading: EditButton(), trailing:
                Button(action: {
                    
                    self.showingAddActivity = true
                }){
                    Image(systemName: "plus")
                }
            )
            .sheet(isPresented: $showingAddActivity){
                //add addViewActivity
                AddActivityView(activities: activities)
            }
        }
    }
    
    func removeActivity(at offSets: IndexSet){
        activities.activities.remove(atOffsets: offSets)
    }
}

struct ActivitiesView_Previews: PreviewProvider {
    static var previews: some View {
        ActivitiesView()
    }
}

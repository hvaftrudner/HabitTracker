//
//  Activity.swift
//  HabitTracker
//
//  Created by Kristoffer Eriksson on 2021-03-18.
//

import Foundation
import SwiftUI

struct Activity: Codable, Identifiable {
    var id = UUID()
    var name: String
    let activity: String
    let describtion: String
    var count: Int
}

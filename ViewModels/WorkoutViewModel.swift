//  WorkoutViewModel.swift
//  Muscle_Journal
//
//  Created by Abbas on 22/05/2025.

import Foundation

class WorkoutViewModel: ObservableObject {
    @Published var recentWorkouts: [Workout] = [
        Workout(title: "Day #17", date: Date(), notes: "Bench press\n  Reps: 15 , 12 , 10"),
        Workout(title: "Day #16", date: Date().addingTimeInterval(-086400), notes: "Squats, \n  lunges"),
        Workout(title: "Day #15", date: Date().addingTimeInterval(-172800), notes: "Squats, \n  lunges"),
        Workout(title: "Day #14", date: Date().addingTimeInterval(-259200), notes: "Squats, \n  lunges"),
        Workout(title: "Day #13", date: Date().addingTimeInterval(-345600), notes: "Squats, \n  lunges"),
        Workout(title: "Day #12", date: Date().addingTimeInterval(-432000), notes: "Squats, \n  lunges"),
        Workout(title: "Day #11", date: Date().addingTimeInterval(-518400), notes: "Squats, \n  lunges"),
    ]
}

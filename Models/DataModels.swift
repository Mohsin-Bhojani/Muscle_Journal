//  DataModels.swift
//  Muscle_Journal
//
//  Created by Abbas on 22/05/2025.

import Foundation

struct Workout: Identifiable {
    let id = UUID()
    let title: String
    let date: Date
    let notes: String
}



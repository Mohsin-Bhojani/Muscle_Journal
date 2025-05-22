//  StatType.swift
//  Muscle_Journal
//
//  Created by Abbas on 22/05/2025.

enum StatType: String, CaseIterable, Hashable, Identifiable {
    case workouts, written, visited, journaled, daily, weekly, entries, `default`

    var id: String { self.rawValue }

    var displayName: String {
        switch self {
        case .workouts: return "Workouts"
        case .written: return "Written"
        case .default: return "All"
        case .journaled: return ""
        case .visited: return ""
        case .daily: return ""
        case .weekly: return ""
        case .entries: return ""
        }
    }

    var iconName: String {
        switch self {
        case .workouts: return "figure.strengthtraining.traditional"
        case .written: return "pencil"
        case .default: return "window"
        case .journaled: return ""
        case .visited: return ""
        case .daily: return ""
        case .weekly: return ""
        case .entries: return ""
        }
    }
}


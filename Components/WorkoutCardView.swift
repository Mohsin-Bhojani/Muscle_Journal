//  WorkoutCardView.swift
//  Muscle_Journal
//
//  Created by Abbas on 22/05/2025.

import SwiftUI

struct WorkoutCardView: View {
    let workout: Workout

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(workout.title)
                .font(.headline)

            Text(workout.date.formatted(date: .abbreviated, time: .shortened))
                .font(.subheadline)
                .foregroundColor(.gray)

            Text(workout.notes)
                .font(.body)
                .fixedSize(horizontal: false, vertical: true) // allows multiline
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading) // ← important
        .background(Color.white.opacity(0.1)) // soft transparent card
        .foregroundColor(.white) // ensures visibility
        .cornerRadius(12)
        .shadow(radius: 1)
    }
}

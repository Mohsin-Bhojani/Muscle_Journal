//  StatBar.swift
//  Muscle_Journal
//
//  Created by Abbas on 22/05/2025.

import SwiftUI

struct StatsBar: View {
    let workoutCount: Int
    let onStatSelected: (StatType) -> Void  // << Add this line

    var body: some View {
        HStack(spacing: 16) {
            ForEach(StatType.allCases, id: \.self) { stat in
                Button(action: {
                    onStatSelected(stat) // << Call the closure
                }) {
                    VStack {
                        Image(systemName: stat.iconName)
                            .font(.title2)
                        Text(stat.displayName)
                            .font(.caption)
                    }
                    .foregroundColor(.white)
                }
            }
        }
        .padding()
        .background(Color.white.opacity(0.1))
        .cornerRadius(10)
    }
}


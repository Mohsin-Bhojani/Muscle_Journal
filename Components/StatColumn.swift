//  StatColumn.swift
//  Muscle_Journal
//
//  Created by Abbas on 22/05/2025.

import SwiftUI

struct StatColumn: View {
    let title: String
    let value: String

    var body: some View {
        VStack {
            Text(title)
                .font(.caption)
                .foregroundColor(.white.opacity(0.7))
                .frame(maxWidth: .infinity, alignment: .center)

            Text(value)
                .font(.title3.bold())
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .center)
        }
        .padding(.vertical, 8)
        .frame(maxWidth: .infinity)
    }
}


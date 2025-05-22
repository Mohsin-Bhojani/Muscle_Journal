//  NewEntryView.swift
//  Muscle_Journal
//
//  Created by Abbas on 22/05/2025.

import SwiftUI

struct NewEntryView: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        ZStack {
            // Background Gradient
            LinearGradient(
                gradient: Gradient(colors: [
                    Color(red: 20/255, green: 30/255, blue: 48/255),
                    Color(red: 36/255, green: 123/255, blue: 160/255)
                ]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()

            VStack(alignment: .leading, spacing: 20) {
                // Header with Manual Close Button
                HStack {
                    Text("New Entry")
                        .font(.largeTitle.bold())
                        .foregroundColor(.white)
                    Spacer()
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark")
                            .foregroundColor(.white)
                            .padding(8)
                            .background(Color.black.opacity(0.3))
                            .clipShape(Circle())
                    }
                }
                .padding(.horizontal)
                .padding(.top)

                Spacer()

                // Icon + Title Placeholder
                HStack(spacing: 12) {
                    Text("Add Exercise")
                        .font(.title2.bold())
                        .foregroundColor(.white.opacity(0.9))
                    
                    Image(systemName: "plus.circle")
                        .font(.system(size: 30))
                        .foregroundColor(.white)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.white.opacity(0.1))
                .cornerRadius(12)
                .padding(.horizontal)

                Spacer()
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    NewEntryView()
}



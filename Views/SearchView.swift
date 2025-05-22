//  SearchView.swift
//  Muscle_Journal
//
//  Created by Abbas on 22/05/2025.

import SwiftUI

struct SearchView: View {
    @Environment(\.dismiss) var dismiss
    @State private var query = ""
    @State private var showEquipmentFilter = false
    @State private var selectedEquipment: String? = nil
    @State private var selectedMuscleGroup: String = "All"

    let equipmentOptions = ["Bar", "Dumbbell", "EZ Bar", "Band", "Bodyweight"]
    let muscleGroups = ["All", "Chest", "Back", "Legs", "Arms", "Shoulders", "Core"]

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

            VStack(spacing: 16) {
                // Header
                HStack {
                    Text("Search")
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

                // Search + Filter Row
                HStack(spacing: 10) {
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                        TextField("Search workouts...", text: $query)
                            .foregroundColor(.white)
                            .autocapitalization(.none)
                    }
                    .padding(10)
                    .background(Color.white.opacity(0.1))
                    .cornerRadius(12)

                    Button(action: {
                        showEquipmentFilter = true
                    }) {
                        Image(systemName: "slider.horizontal.3")
                            .foregroundColor(.white)
                            .padding(10)
                            .background(Color.white.opacity(0.1))
                            .clipShape(Circle())
                    }
                }
                .padding(.horizontal)

                // Muscle Group Filter Tabs
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 10) {
                        ForEach(muscleGroups, id: \.self) { group in
                            Button(action: {
                                selectedMuscleGroup = group
                            }) {
                                Text(group)
                                    .padding(.vertical, 6)
                                    .padding(.horizontal, 12)
                                    .background(selectedMuscleGroup == group ? Color.white.opacity(0.3) : Color.clear)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                            }
                        }
                    }
                    .padding(.horizontal)
                }

                Spacer()

                // Placeholder for Search Results
                VStack(spacing: 8) {
                    if query.isEmpty {
                        Text("Start typing to search workouts")
                            .foregroundColor(.gray)
                    } else {
                        Text("Search results for \"\(query)\"")
                            .foregroundColor(.gray)
                        if let selected = selectedEquipment {
                            Text("Filtered by: \(selected)")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                        Text("Muscle Group: \(selectedMuscleGroup)")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                }

                Spacer()
            }
            .padding(.top)
        }
        .sheet(isPresented: $showEquipmentFilter) {
            EquipmentFilterSheet(selectedEquipment: $selectedEquipment)
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct EquipmentFilterSheet: View {
    @Binding var selectedEquipment: String?
    let equipmentOptions = ["Bar", "Dumbbell", "EZ Bar", "Band", "Bodyweight"]

    var body: some View {
        VStack {
            Text("Select Equipment")
                .font(.headline)
                .padding()

            ForEach(equipmentOptions, id: \.self) { equipment in
                Button(action: {
                    selectedEquipment = equipment
                }) {
                    HStack {
                        Text(equipment)
                        Spacer()
                        if selectedEquipment == equipment {
                            Image(systemName: "checkmark")
                        }
                    }
                    .padding()
                }
                .background(Color.gray.opacity(0.1))
                .cornerRadius(8)
                .padding(.horizontal)
            }

            Button("Clear Filter") {
                selectedEquipment = nil
            }
            .foregroundColor(.red)
            .padding()

            Spacer()
        }
        .presentationDetents([.medium, .large])
    }
}


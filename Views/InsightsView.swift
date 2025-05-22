//  InsightsView.swift
//  Muscle_Journal
//
//  Created by Abbas on 22/05/2025.

import SwiftUI

struct InsightsView: View {
    let selectedStat: StatType
    @State private var currentStat: StatType
    @State private var selectedDate = Date()
    
    @Environment(\.dismiss) var dismiss

    init(selectedStat: StatType) {
        self.selectedStat = selectedStat
        _currentStat = State(initialValue: selectedStat)
    }

    private let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    // Sample active dates (replace with your actual data)
    private let activeDates: [Date] = [
        Calendar.current.date(byAdding: .day, value: -1, to: Date())!,
        Calendar.current.date(byAdding: .day, value: -3, to: Date())!,
        Calendar.current.date(byAdding: .day, value: -10, to: Date())!
    ]

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
                // Header
                HStack {
                    Text("Insights")
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

                ScrollView {
                    VStack(spacing: 20) {
                        
                        // MARK: - Grid Section
                        Text("Streak")
                            .font(.title2)
                            .foregroundColor(.white)
                            .padding(.horizontal)
                        
                        LazyVGrid(columns: columns, spacing: 16) {
                            insightBox(title: "Longest Daily Streak", value: "26", subtitle: "Days", color: .red, stat: .daily)
                            insightBox(title: "Longest Weekly Streak", value: "7", subtitle: "Weeks", color: .purple, stat: .weekly)
                            insightBox(title: "Entries", value: "70", subtitle: "This Year", color: .blue, stat: .entries)
                        }
                        .padding(.horizontal)

                        Text("Stats")
                            .font(.title2)
                            .foregroundColor(.white)
                            .padding(.horizontal)

                        LazyVGrid(columns: columns, spacing: 16) {
                            insightBox(title: "Journaled", value: "106", subtitle: "Days", color: .red, stat: .journaled)
                            insightBox(title: "Visited", value: "27", subtitle: "Times", color: .blue, stat: .visited)
                            insightBox(title: "Written", value: "4.1K", subtitle: "Words", color: .pink, stat: .written)
                        }
                        .padding(.horizontal)
                        .padding(.bottom, 40)
                        
                        // MARK: - Calendar Section
                        Text("Activity Calendar")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding(.top)
                        
                        CalendarView(selectedDate: $selectedDate, activeDates: activeDates)
                            .background(Color.white.opacity(0.05))
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                            .padding(.horizontal)
                        
                        Text("Selected Date: \(formattedDate(selectedDate))")
                            .foregroundColor(.white)
                            .font(.caption)
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)

    }

    // MARK: - Reusable Stat Widget
    @ViewBuilder
    func insightBox(title: String, value: String, subtitle: String, color: Color, isWide: Bool = false, stat: StatType) -> some View {
        let isSelected = (currentStat == stat)
        let boxSize: CGFloat = UIScreen.main.bounds.width / 2 - 32

        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .font(.caption)
                .foregroundColor(.secondary)
            Text(value)
                .font(.title.bold())
                .foregroundColor(.white)
            Text(subtitle)
                .font(.caption2)
                .foregroundColor(.secondary)
        }
        .padding()
        .frame(
            width: isWide ? (UIScreen.main.bounds.width - 48) : boxSize,
            height: 100,
            alignment: .leading
        )
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(color.opacity(0.3))
                .saturation(isSelected ? 1 : 0)
                .grayscale(isSelected ? 0 : 1)
        )
        .onTapGesture {
            currentStat = stat
        }
    }

    func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: date)
    }
}



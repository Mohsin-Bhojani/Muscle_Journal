//  CalendarView.swift
//  Muscle_Journal
//
//  Created by Abbas on 22/05/2025.

import SwiftUI

struct CalendarView: View {
    @Binding var selectedDate: Date
    let activeDates: [Date]

    private let calendar = Calendar.current
    private let columns = Array(repeating: GridItem(.flexible()), count: 7)

    private var currentMonthDates: [Date] {
        let today = Date()
        let range = calendar.range(of: .day, in: .month, for: today)!
        let startOfMonth = calendar.date(from: calendar.dateComponents([.year, .month], from: today))!

        return range.compactMap { day -> Date? in
            calendar.date(byAdding: .day, value: day - 1, to: startOfMonth)
        }
    }

    var body: some View {
        LazyVGrid(columns: columns, spacing: 8) {
            ForEach(["T", "F", "S ", "S", "M", "T ", "W"], id: \.self) { day in
                Text(day)
                    .font(.caption)
                    .foregroundColor(.gray)
            }

            ForEach(currentMonthDates, id: \.self) { date in
                let isSelected = calendar.isDate(date, inSameDayAs: selectedDate)
                let isActive = activeDates.contains { calendar.isDate($0, inSameDayAs: date) }

                Text("\(calendar.component(.day, from: date))")
                    .frame(maxWidth: .infinity, minHeight: 40)
                    .background(
                        Circle()
                            .fill(isSelected ? Color.blue : isActive ? Color.blue.opacity(0.2) : Color.clear)
                    )
                    .foregroundColor(isSelected ? .white : .primary)
                    .onTapGesture {
                        selectedDate = date
                    }
            }
        }
        .padding()
    }
}


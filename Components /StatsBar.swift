import SwiftUI

enum StatType: String, Identifiable, Hashable {
    case Default
    case workouts
    case duration
    case calories

    var id: String { rawValue }

    var displayName: String {
        switch self {
        case .Default : return "Default"
        case .workouts: return "Workouts"
        case .duration: return "Duration"
        case .calories: return "Calories"
        }
    }

    var value: String {
        switch self {
        case .Default : return ""
        case .workouts: return "" // passed separately
        case .duration: return "45 min"
        case .calories: return "320 kcal"
        }
    }
}

struct StatsBar: View {
    let workoutCount: Int

    var body: some View {
        HStack(spacing: 16) {
            NavigationLink(value: StatType.workouts) {
                StatColumn(title: StatType.workouts.displayName,
                           value: "\(workoutCount)")
            }
            .buttonStyle(.plain)

            Divider()
                .frame(height: 40)
                .background(Color.white.opacity(0.4))

            NavigationLink(value: StatType.duration) {
                StatColumn(title: StatType.duration.displayName,
                           value: StatType.duration.value)
            }
            .buttonStyle(.plain)

            Divider()
                .frame(height: 40)
                .background(Color.white.opacity(0.4))

            NavigationLink(value: StatType.calories) {
                StatColumn(title: StatType.calories.displayName,
                           value: StatType.calories.value)
            }
            .buttonStyle(.plain)
        }
        .padding()
        .cornerRadius(12)
    }
}

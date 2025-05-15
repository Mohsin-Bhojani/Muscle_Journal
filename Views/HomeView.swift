import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = WorkoutViewModel()
    @State private var showSearch = false
    @State private var selectedStat: StatType? = nil
    @State private var showNotifications = false
    @State private var isLocked = false // For Lock App logic
    
    var body: some View {
        NavigationStack {
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
                
                // Main Content
                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
                        // Title and top-right buttons in one row
                        HStack {
                            Text("Gym Tracker")
                                .font(.largeTitle.bold())
                                .foregroundColor(.white)

                            Spacer()

                            HStack(spacing: 16) {
                                Button(action: {
                                    showSearch = true
                                }) {
                                    Image(systemName: "magnifyingglass")
                                        .font(.title2)
                                        .foregroundColor(.white)
                                }

                                Menu {
                                    Button("Insights") {
                                        selectedStat = .Default
                                    }
                                    Button("Notifications") {
                                        showNotifications = true
                                    }
                                    Button("Lock App") {
                                        isLocked = true
                                    }
                                } label: {
                                    Image(systemName: "ellipsis.circle")
                                        .font(.title2)
                                        .foregroundColor(.white)
                                }
                            }
                        }
                        .padding(.top, 20)
                        
                        // Stats Bar
                        StatsBar(workoutCount: viewModel.recentWorkouts.count)

                        // Workout Cards or Message
                        VStack(spacing: 12) {
                            if viewModel.recentWorkouts.isEmpty {
                                Text("No workouts yet.")
                                    .foregroundColor(.white.opacity(0.6))
                            } else {
                                ForEach(viewModel.recentWorkouts) { workout in
                                    WorkoutCardView(workout: workout)
                                }
                            }
                        }
                    }
                    .padding()
                }
                
                .navigationDestination(isPresented: $showSearch) {
                    SearchView()
                }
                .navigationDestination(item: $selectedStat) { stat in
                    InsightsView(selectedStat: stat)
                }
                
                // Floating + Button
                VStack {
                    Spacer()
                    NavigationLink(destination: NewEntryView()) {
                        Image(systemName: "plus")
                            .font(.system(size: 22, weight: .bold))
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.teal)
                            .clipShape(Circle())
                            .shadow(radius: 5)
                    }
                    .padding(.bottom, 30)
                }
            }
            .navigationDestination(for: StatType.self) { stat in
                InsightsView(selectedStat: stat)
            }
        }
    }
}

#Preview {
        HomeView()
}

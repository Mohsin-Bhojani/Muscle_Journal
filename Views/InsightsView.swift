import SwiftUI

struct InsightsView: View {
    let selectedStat: StatType
    
    var body: some View {
        ZStack {
            // iOS 18 Journal-style blue gradient
            LinearGradient(
                gradient: Gradient(colors: [
                    Color(red: 20/255, green: 30/255, blue: 48/255),
                    Color(red: 36/255, green: 123/255, blue: 160/255)
                ]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            VStack {
                Text("Insights")
                    .font(.largeTitle.bold())
                
                Text("Selected: \(selectedStat.displayName)")
                    .font(.title2)
                    .padding(.top, 8)
            }
            .padding()
            
        }
    }
}

#Preview {
    InsightsView(selectedStat: .workouts)
}

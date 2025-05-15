import SwiftUI

struct NewEntryView: View {
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
            
            Text("Create a new workout")
                .navigationTitle("New Entry")
        }
    }
}

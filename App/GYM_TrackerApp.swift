import SwiftUI

@main
struct GYM_TrackerApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
                .tint(Color.blue) // iOS 18-inspired blue
        }
    }
}

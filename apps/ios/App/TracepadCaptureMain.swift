import SwiftUI

@main
struct TracepadCaptureApp: App {
    var body: some Scene {
        WindowGroup {
            TracepadCaptureRootView()
                .preferredColorScheme(.light)
        }
    }
}

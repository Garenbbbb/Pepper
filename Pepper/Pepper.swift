
import SwiftUI

@main
struct Pepper: App {
    var body: some Scene {
        WindowGroup {
            SplashView().environment(ModelData())
        }
    }
}

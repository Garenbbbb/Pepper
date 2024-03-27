
import SwiftUI

// ProfileView is responsible for displaying the profile details of the user.
struct ProfileView: View {
    @Environment(ModelData.self) var modelData
    
    var user: User

    var body: some View {
        // Display user details using the UserDetail view
        UserDetail(user: modelData.users[0])
    }
}


#Preview {
    let modelData = ModelData()
        return ProfileView(user: modelData.users[0])
            .environment(modelData)
}

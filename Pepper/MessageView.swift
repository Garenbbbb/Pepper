
import SwiftUI

// MessageView is responsible for displaying the list of matched users and allowing the user to initiate a chat with them.
struct MessageView: View {
    @Environment(ModelData.self) var modelData
    
    var user: User
    // Computed property to filter out matched users from the user's matches
    var matchedUsers: [User] {
            user.matches.compactMap { matchId in
                modelData.users.first { $0.id == matchId }
            }
        }
    
    var body: some View {
            NavigationSplitView {
                // Display message based on whether there are matched users or not
                if matchedUsers.count > 0 {
                    Text("Congratulations! You've got a list of mathced pets").foregroundStyle(Color.pink)
                }else{
                    Text("Go and find more matches!").foregroundStyle(Color.pink)
                }
                // Display list of matched users
                List(matchedUsers) { matchUser in
                    NavigationLink {
                        ChatView(user: user, matchUser: matchUser)
                    } label: {
                        // Display user image and name in list
                        matchUser.image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                        Text(matchUser.name)
                    }
                }
                .navigationTitle("Message")
            } detail: {
                Text("Select a user to chat with")
            }
        }
}

#Preview {
    let modelData = ModelData()
    return MessageView(user: modelData.users[0])
        .environment(modelData)
}

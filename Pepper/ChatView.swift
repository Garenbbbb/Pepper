
import SwiftUI
// ChatView is responsible for displaying the chat interface between the user and a matched user.
struct ChatView: View {
    var user: User
    var matchUser: User
    @State private var text: String = ""

    var body: some View {
        VStack{
            // Display the name of the matched user
            Text("Chat with \(matchUser.name)")
            // Text field for entering messages
            TextField("Enter your message", text: $text)
                .multilineTextAlignment(.center)

        }
        // Set navigation title to the name of the matched user
        .navigationTitle(matchUser.name)
        .navigationBarTitleDisplayMode(.inline)
    }

}

#Preview {
    let modelData = ModelData()
    return ChatView(user: modelData.users[0], matchUser: modelData.users[1])
        .environment(modelData)
}

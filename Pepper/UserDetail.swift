
import SwiftUI
// UserDetail is responsible for displaying detailed information about a user.
struct UserDetail: View {
    @Environment(ModelData.self) var modelData
    @Environment(\.presentationMode) var presentationMode
    
    
    var user: User
    // Compute the index of the user in the modelData.users array
    var userIndex: Int {
            modelData.users.firstIndex(where: { $0.id == user.id })!
        }
    
    
    var body: some View {
        @Bindable var modelData = modelData
        
        ScrollView {
            VStack {
                // Display user image
                CircleImage(image: user.image)
                    .offset(y: 100)
                    .padding(.bottom, 100)

                // Display user name
                VStack(alignment: .leading) {
                    Text(user.name)
                        .font(.title)
                        .foregroundStyle(Color.pink)
                    // Display user details: age, gender, size, type
                    HStack {
                        Text("Age: \(user.age)")
                        Spacer()
                        Text("Gender: \(user.gender.rawValue)")
                        Spacer()
                        Text("Size: \(user.size.rawValue)")
                        Spacer()
                        Text("Type: \(user.type.rawValue)")
                    }
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    
                    Divider()
                    // Display user description
                    Text("About \(user.name)")
                        .font(.title2)
                        .foregroundStyle(Color.pink)
                    ScrollView{
                        Text(user.description).foregroundStyle(Color.gray)
                    }
   
                }
                
                .padding()
                Spacer()
                
            }
            .navigationTitle(user.name)
            .navigationBarTitleDisplayMode(.inline)
            
        }
    }
}


#Preview {
    let modelData = ModelData()
        return UserDetail(user: modelData.users[0])
            .environment(modelData)
}

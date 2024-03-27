
import SwiftUI

// HomeView is responsible for displaying the main screen of the application where users can discover and interact with other users.
struct HomeView: View {
    @Environment(ModelData.self) var modelData
    @State private var currentIndex: Int = 1
    
    @State private var showingPopover = false
    
    
    var body: some View {
        NavigationView {
            VStack {
                // Title and location display
                Text("Discover!")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color.pink.opacity(0.8))
                Text("Chicago")
                // Displaying user details and navigation link to user detail view
                NavigationLink(destination: UserDetail(user: modelData.users[currentIndex])) {
                    ZStack {
                        // User image and details
                        modelData.users[currentIndex].image
                            .resizable()
                            .scaledToFit()
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.pink.opacity(0.5), lineWidth: 3)
                        )
                        VStack {
                            
                            Spacer()
                            // User information overlay
                            HStack {
                                Spacer().frame(width: 50)
                                VStack {
                                    HStack {
                                        Image(systemName: "checkmark.seal.fill")
                                        Text(modelData.users[currentIndex].name)
                                            .font(.title).bold()
                                        .foregroundStyle(Color.white)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    }
                                 
                                    HStack {
                                        Image(systemName: "person.circle").foregroundColor(.white)
                                        Text(modelData.users[currentIndex].gender.rawValue)
                                            .font(.system(size: 20))
                                        .foregroundStyle(Color.white)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    }
                                   
                                    HStack {
                                        Image(systemName: "location.circle").foregroundColor(.white)
                                        Text("Less than 1km")
                                            .font(.system(size: 15))
                                        .foregroundStyle(Color.white)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    }
                                    
                                }
                                Spacer()
                            }.background(Color.pink.opacity(0.7))
                            
                        }
                    }
                }.scaledToFit().frame(width: 360, height: 450)
                // Like and dislike buttons
                HStack {
                    Button(action: {
                        //logging for pets
                        print(modelData.users[currentIndex])
                        showingPopover = ch()
                        updateLike()

                    }) {
                        Image("like").resizable().frame(height: 80).frame(width: 80)
                            .padding()
                    }.popover(isPresented: $showingPopover) {
                        VStack{
                            modelData.users[currentIndex-1].image.resizable().scaledToFit()
                            Text("It is a match!")
                                .font(.largeTitle)
                                .padding()
                            Text("Start a conversation now with each other!")
                        }
                    }.foregroundColor(.red)
                        .background(Color.pink.opacity(0.8))
                        .clipShape(Circle())
                        .shadow(radius: 2)
                    Spacer().frame(width: 50)
                    Button( action: {
                        updateDislike()
                    }){
                        Image("wrong").resizable().frame(height: 80).frame(width: 80)
                            .padding()
                    }.foregroundColor(.red)
                        .background(Color.pink.opacity(0.8))
                        .clipShape(Circle())
                        .shadow(radius: 2)
                        
                }
                .padding()
            }

        }
    }
    
    // Check if there's a match between the current user and the displayed user
    private func ch() -> Bool{
        let otherUser = modelData.users[currentIndex]
        return otherUser.likes.contains(modelData.users[0].id)
    }
    // Update user likes and check for matches
    private func updateLike(){
        let otherUser = modelData.users[currentIndex]
        if !modelData.users[currentIndex].likes.contains(otherUser.id) {
            modelData.users[0].likes.append(otherUser.id)
        
            if otherUser.likes.contains(modelData.users[0].id){
                matchPet(petId: modelData.users[0].id, likedPetId: otherUser.id)
            }
        }
        moveToNextPet()
    }
    // Update user dislikes
    private func updateDislike(){
        let otherUser = modelData.users[currentIndex]
        if !modelData.users[currentIndex].dislikes.contains(otherUser.id) {
            modelData.users[0].dislikes.append(otherUser.id)
        }
        moveToNextPet()
    }
    
    
    // Move to the next user
    private func moveToNextPet() {
        if currentIndex < modelData.users.count - 1 {
            currentIndex += 1
        } else {
            currentIndex = 1
        }
    }
    
    private func matchPet(petId: Int, likedPetId: Int) {
        if let index = modelData.users.firstIndex(where: { $0.id == petId }) {
            modelData.users[index].matches.append(likedPetId)
            if let otherIndex = modelData.users.firstIndex(where: { $0.id == likedPetId }){
                modelData.users[otherIndex].matches.append(petId)
            }
        }
    }
}

        
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        let modelData = ModelData()
        return HomeView()
                .environment(modelData)
    }
}

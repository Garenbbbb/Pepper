
import SwiftUI
// CircleImage is a view that displays an image inside a circular frame with a pink overlay and shadow.
struct CircleImage: View {
    var image: Image
    var body: some View {
        image
            .resizable()
            .scaledToFit()
            .frame(width: 200, height: 200)
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.pink.opacity(0.7), lineWidth: 5)
            }
            .shadow(radius: 7)
    
    }
}

#Preview {
    CircleImage(image: Image("cat1"))
}

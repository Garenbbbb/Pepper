import Foundation
import SwiftUI

/// Represents a user in the pet matching application.
struct User: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var age: Int
    var type: PetType
    var gender: PetGender
    var size: PetSize
    var description: String
    
    var likes: [Int] // List of pet ids this pet has liked
    var dislikes: [Int] // List of pet ids this pet has disliked
    var matches:[Int] // List of pet ids are matched
    
    private var imageName: String // Name of the image file representing the user
        var image: Image {
            Image(imageName)
        }
    
}

// MARK: - PetType
/// Enumeration representing different types of pets.
enum PetType: String, CaseIterable, Codable {
    case cat = "Cat"
    case dog = "Dog"
    case rabbit = "Rabbit"
    case turtle = "Turtle"
    case snake = "Snake"
    case other = "Other"
}

// MARK: - PetGender
/// Enumeration representing gender of pets.
enum PetGender: String, CaseIterable, Codable {
    case male = "Male"
    case female = "Female"
}

// MARK: - PetSize
/// Enumeration representing size categories of pets.
enum PetSize: String, CaseIterable, Codable {
    case small = "Small"
    case medium = "Medium"
    case large = "Large"
}



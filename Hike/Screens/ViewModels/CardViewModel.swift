import Foundation
import SwiftUI

class CardViewModel: ObservableObject {
    @Published private var imageNumber: Int = 1;
    @Published private var randomNumber: Int = 1;
    @Published var isShowingSheet: Bool = false 
    
    
    func getImageNumber() -> Int {
        return imageNumber;
    }
    
    func getRandomNumber() -> Int {
        return randomNumber;
    }
    
    func randomImage(){
        withAnimation(.easeOut(duration: 0.5)){
            randomNumber = Int.random(in: 1...5)
            imageNumber = randomNumber
            print(randomNumber)
        }
    }
    
}

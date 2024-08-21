import SwiftUI

struct CardView: View {
    // MARK: - PROPERTIES
    
    @StateObject var cardViewModel: CardViewModel = CardViewModel()
    
    
    var body: some View {
        ZStack {
            CustomBackgroundView()
            VStack {
                VStack(alignment: .leading) {
                    HStack {
                        Text("Hiking")
                            .fontWeight(.black)
                            .font(.system(size: 52))
                        .foregroundStyle(LinearGradient(colors: [.customGrayLight, .customGrayMedium], startPoint: .top, endPoint: .bottom))
                        
                        
                        Button{
                            print("I am pressed")
                            cardViewModel.isShowingSheet.toggle()
                        } label: {
                            CustomButtonView()
                        }
                        .sheet(isPresented: $cardViewModel.isShowingSheet, content: {
                            SettingsView()
                                .presentationDragIndicator(.visible)
                                .presentationDetents([.fraction(0.52), .fraction(1)])
                        })
                        
                        
                    }
                    
                    Text("A fun and enjoyable outdoor activity for friends and families.")
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: 270)
                        .italic()
                        .foregroundColor(.customGrayMedium)
                    
                }
                .padding(.leading, 30)
                
                ZStack {
                    CustomCircleView()
                    Image("image-\(cardViewModel.getImageNumber())")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 350)
                    

                }
                Button(){
                    cardViewModel.randomImage()
                } label: {
                    Text("Explore More")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundStyle(
                            LinearGradient(colors: [.customGreenLight, .customGreenMedium], startPoint: .top, endPoint: .bottom)
                        )
                }
                .padding(.vertical)
                .padding(.horizontal, 30)
                .background(
                    LinearGradient(colors: [.customGrayLight, .customGrayMedium], startPoint: .top, endPoint: .bottom)
                )
                .cornerRadius(40)
            }

        }
        .frame(width: 380, height: 720)
    }
}

#Preview {
    CardView()
}

import SwiftUI

struct MotionAnimationView: View {
    // MARK: - PROPERTIES
    @State private var randomCircle: Int = Int.random(in: 6...12)
    @State private var isAnimating: Bool = false;
    
    //RANDOM COORDINATES
    func randomCoordinate() -> CGFloat {
        return CGFloat.random(in: 0...256)
    }
    
    //RANDOM SIZE
    func randomSize() -> CGFloat {
        return CGFloat.random(in: 4...80)
    }
    
    //RANDOM SPEED
    func randomScale() -> Double {
        return Double.random(in: 0.1...2.0)
    }
    
    
    //RANDOM SPEED
    func randomSpeed() -> Double {
        return Double.random(in: 0.05...1.0 )
    }
    
    //RANDOM DELAY
    func randomDelay() -> Double {
        return Double.random(in: 0...2  )
    }

    var body: some View {
        ZStack {
            ForEach(0...randomCircle, id: \.self) { item in
                Circle()
                .fill(.white)
                .frame(width: randomSize())
                .opacity(0.25)
                .position(
                    x: randomCoordinate(),
                    y: randomCoordinate()
                )
                .scaleEffect(isAnimating ? randomScale() : 1)
                .onAppear(perform: {
                    withAnimation(.interpolatingSpring(stiffness: 0.35, damping: 0.35)
                        .repeatForever()
                        .speed(randomSpeed())
                        .delay(randomDelay())
                    ){
                        isAnimating = true
                    }
                })
            }
        } // : ZStack
        .frame(width: 256, height: 256)
        .mask(Circle())
        .drawingGroup()
    }
}

#Preview {
    MotionAnimationView()
        .background(
            Circle().fill(.teal)
        )
}

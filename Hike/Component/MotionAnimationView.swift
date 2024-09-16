//
//  MotionAnimationView.swift
//  Hike
//
//  Created by Sinan Engin Yıldız on 13.09.2024.
//

import SwiftUI

struct MotionAnimationView: View {
    
    @State private var randomCircle : Int = Int.random(in: 6...12)
    @State private var isAnimating : Bool = false
    
    // MARK - FUNCTIONS : RANDOM COORDINATE
    
    func RandomCoordinate() -> CGFloat {
        return CGFloat.random(in: 0...256)
    }
    
    
    // RANDOM SIZE
    
    func RandomSize() -> CGFloat {
        return CGFloat(Int.random(in: 4...80))
    }
    
    // RANDOM SCALE
    func RandomScale() -> CGFloat {
        return CGFloat(Double.random(in: 0.1...2.0))
    }
    
    // RANDOM SPEED
    func RandomSpeed() -> Double {
        return Double.random(in: 0.05...1.0)
    }
    
    // RANDOM DELAY
    func RandomDelay() -> Double {
        return Double.random(in: 0...2)
    }
    
    
    
    var body: some View {
        ZStack{
            ForEach(0...randomCircle, id: \.self) { item in
                Circle()
                    .foregroundColor(.white)
                .opacity(0.25)
                .frame(width: RandomSize())
                .position(
                    x: RandomCoordinate(),
                    y: RandomCoordinate()
                )
                .scaleEffect(isAnimating ? RandomScale() : 1)
                .onAppear(perform: {
                    withAnimation(
                        .interpolatingSpring(stiffness: 0.25,damping: 
                                                0.25)
                        .repeatForever()
                        .speed(RandomSpeed())
                        .delay(RandomDelay())
                    ) {
                        isAnimating = true
                    }
                    
                })
                
            }
        }
        .frame(width: 256, height: 256)
        .mask(Circle())
        .drawingGroup()
    }
}

#Preview {
        MotionAnimationView()
        .background(
        Circle()
            .fill(.teal)
        )
}

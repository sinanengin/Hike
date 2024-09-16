//
//  CardView.swift
//  Hike
//
//  Created by Sinan Engin Yıldız on 4.09.2024.
//

import SwiftUI

struct CardView: View {
    
    //MARK - PROPERTIES
    
    @State private var imageNumber : Int = 1
    @State private var randomNumber : Int = 1
    
    
    //MARK - FUNCTIONS
    
    func randomImage() {
        
        repeat {
            randomNumber = .random(in: 1...5)
        } while randomNumber == imageNumber
        
        imageNumber = randomNumber
    }
    
    
    
    
    
    
    var body: some View {
        
        
        // MARK - CARD
        ZStack {
            CustomBackgroundView()
            VStack {
                // MARK - HEADER
                VStack(alignment: .leading) {
                    HStack {
                        Text("Hiking")
                            .fontWeight(.black)
                            .font(.system(size: 52))
                        .foregroundStyle(LinearGradient(colors: [.customGrayLight , .customGrayMedium], startPoint: .top, endPoint: .bottom))
                        
                        Spacer(minLength:10)
                        
                        Button{
                            // ACTION : Show a sheet
                            print("The button was pressed.")
                        }label: {
                            CustomButtonView()
                        }
                    }
                    
                    Text("Fun and enjoyable outdoor activities for friends and families.")
                        .multilineTextAlignment(.leading)
                        .italic()
                        .foregroundColor(.customGrayMedium)
                    
                }//:HEADER
                .padding(.horizontal, 30)
                
                // MARK - MAIN CONTENT
                
                
                ZStack{
                    
                    CustomCircleView()
                    
                    Image("image-\(imageNumber)")
                        .resizable()
                        .scaledToFit()
                        .animation(.default, value: imageNumber)
                }
                // MARK - FOOTER
                
                Button{
                    // ACTION: generate a random number
                    print("Image has been changed.")
                    randomImage()
                    
                }label: {
                    Text("Explore More")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundStyle(LinearGradient(colors: [.customGreenLight, .customGreenMedium], startPoint: .top , endPoint: .bottom))
                        .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/.opacity(0.25),radius: 0.25, x:1, y:2)
                }
                .buttonStyle(GradientButton())
            }
        } // : CARD
        .frame(width: 320, height: 570)
    }
}

#Preview {
    CardView()
}

//
//  MapAnnotationView.swift
//  Africa
//
//  Created by Asadullah Behlim on 12/04/22.
//

import SwiftUI

struct MapAnnotationView: View {
    
    var location: NationalParkLocation
    @State private var Animation : Double = 0.0
    
    // MARK: - Body
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.accentColor)
                .frame(width: 54, height: 54, alignment: .center)
                
            Circle()
              .stroke(Color.accentColor, lineWidth: 2)
              .frame(width: 52, height: 52, alignment: .center)
              .scaleEffect(1 + CGFloat(Animation))
            // Scale effect never be less than One - Refer Pinch Project For more details
              .opacity(1 - Animation)
             
            
        Image(location.image)
            .resizable()
            .scaledToFit()
            .frame(width: 48, height: 48, alignment: .center)
            .clipShape(Circle())

            
            
            //.overlay(
//            Circle()
//         .fill(Color.accentColor)
//
//            )
        
    }
        .onAppear{
            withAnimation(.easeInOut(duration: 2)
                .repeatForever(autoreverses: false)) {
                    Animation = 1
                }
        }
}
}
struct MapAnnotationView_Previews: PreviewProvider {
    static var locations: [NationalParkLocation] = Bundle.main.decode(file: "locations.json")
    
    
    static var previews: some View {
        MapAnnotationView(location: locations[0])
            .previewLayout(.sizeThatFits)
    }
}

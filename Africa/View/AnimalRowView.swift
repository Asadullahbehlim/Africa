//
//  AnimalRowView.swift
//  Africa
//
//  Created by Asadullah Behlim on 07/04/22.
//

import SwiftUI

struct AnimalRowView: View {
    
    var animal:Animal
    
    
    
    var body: some View {

        HStack(alignment: .center, spacing: 16)
        {
            Image(animal.image)
                      .resizable()
                      .scaledToFill()
            // Zoomed in
            // It depends on requirement
                      .frame(width: 90, height: 90, alignment: .center)
                     .cornerRadius(12)
                  
                  

                  VStack(alignment:.leading, spacing:8){

                      Text(animal.name)
                  .font(.title2)
                  .fontWeight(.heavy)
                  .foregroundColor(.accentColor)

                      Text(animal.headline)
                .font(.footnote)
                .multilineTextAlignment(.leading)
                .lineLimit(2)
                .padding(.trailing, 8)
                  

                  }
              }


    }
}

struct AnimalRowView_Previews: PreviewProvider {
    static let animals: [Animal] = Bundle.main.decode(file: "animals.json")
    
    
    static var previews: some View {
        AnimalRowView(animal: animals[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

//
//  AnimalGridItemView.swift
//  Africa
//
//  Created by Asadullah Behlim on 15/04/22.
//

import SwiftUI

struct AnimalGridItemView: View {
    
    let animal: Animal
    
    var body: some View {
        Image(animal.image)
            .resizable()
            .scaledToFit()
            .cornerRadius(12)
    }
}

struct AnimalGridItemView_Previews: PreviewProvider {
    static let animals: [Animal] = Bundle.main.decode(file: "animals.json")
    static var previews: some View {
        AnimalGridItemView(animal: animals[0])
    }
}

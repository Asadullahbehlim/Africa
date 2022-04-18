//
//  InsertFactView.swift
//  Africa
//
//  Created by Asadullah Behlim on 07/04/22.
//

import SwiftUI

struct InsertFactView: View {
    
    let animal: Animal
    
    var body: some View {
        GroupBox {
        TabView {
        ForEach(animal.fact, id: \.self) { item in
        Text(item)
            }
        } //: tabView
        .tabViewStyle(PageTabViewStyle())
        .frame(minHeight: 148, idealHeight: 168, maxHeight: 180)
        } //: box
                    
        
        
    }
}

struct InsertFactView_Previews: PreviewProvider {
    static let animals: [Animal] = Bundle.main.decode(file: "animals.json")
    
    static var previews: some View {
        InsertFactView(animal: animals[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

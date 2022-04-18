//
//  ExternalWebLinkView.swift
//  Africa
//
//  Created by Asadullah Behlim on 09/04/22.
//

import SwiftUI

struct ExternalWebLinkView: View {
    
    let animal: Animal
    
    
   
    var body: some View {
      GroupBox {
        HStack {
          Image(systemName: "globe")
          Text("Wikipedia")
          Spacer()
          
          Group {
            Image(systemName: "arrow.up.right.square")
            
            Link(animal.name, destination: (URL(string: animal.link) ?? URL(string: "https://wikipedia.org"))!)
              
        
          }
          .foregroundColor(.accentColor)
        } //: hstack
      } //: box
    }
  }

struct ExternalWebLinkView_Previews: PreviewProvider {
    static let animals: [Animal] = Bundle.main.decode(file: "animals.json")
  
  static var previews: some View {
    ExternalWebLinkView(animal: animals[0])
      .previewLayout(.sizeThatFits)
      .padding()
  }
}

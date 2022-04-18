//
//  InsertGalleryView.swift
//  Africa
//
//  Created by Asadullah Behlim on 07/04/22.
//

import SwiftUI

struct InsertGalleryView: View {
    
let animal: Animal

// MARK: - BODY

var body: some View {
  ScrollView(.horizontal, showsIndicators: false) {
    HStack(alignment: .center, spacing: 15) {
      ForEach(animal.gallery, id: \.self) { item in
        Image(item)
          .resizable()
          .scaledToFit()
          .frame(height: 200)
          .cornerRadius(12)
      } // LOOP
    } // HSTACK
  } // Scroll
}
}

// MARK: - PREVIEW

struct InsertGalleryView_Previews: PreviewProvider {
    static let animals: [Animal] = Bundle.main.decode(file: "animals.json")

static var previews: some View {
  InsertGalleryView(animal: animals[0])
    .previewLayout(.sizeThatFits)
    .padding()
}
}

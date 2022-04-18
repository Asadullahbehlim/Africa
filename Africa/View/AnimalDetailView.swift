//
//  AnimalDetailView.swift
//  Africa
//
//  Created by Asadullah Behlim on 07/04/22.
//

import SwiftUI

struct AnimalDetailView: View {
    
    var animal: Animal
    var body: some View {
        ScrollView(.vertical,showsIndicators:true){
        VStack(alignment: .center, spacing: 20) {
            // Hero Img
            
            Image(animal.image)
                .resizable()
                .scaledToFill()
                .frame(width: 400, height: 300, alignment: .center)
            
            // Title
            
            Text(animal.name.uppercased())
                .font(.largeTitle)
                .fontWeight(.heavy)
                .multilineTextAlignment(.center)
                .padding(.vertical, 8)
                .foregroundColor(.primary)
                .background(
                    Color.accentColor
                      .frame(height: 6)
                      .offset(y: 24)
                  )
            
            //Headline
            
            Text(animal.headline)
              .font(.headline)
              .multilineTextAlignment(.leading)
              .foregroundColor(.accentColor)
              .padding(.horizontal)

            //Gallery
            
            Group {
                HeadingView (HeadingImage: "photo.on.rectangle.angled", HeadingText: "Wilderness in pictures" )
                    InsertGalleryView(animal: animal)
            }
            .padding(.horizontal)
            
            // Facts
            
            Group {
                HeadingView(HeadingImage: "questionmark.circle", HeadingText: "Did you know?")
                InsertFactView(animal: animal)
            }
            .padding(.horizontal)
            
            
//
//            GroupBox {
//              TabView {
//                ForEach(animal.fact, id: \.self) { item in
//                  Text(item)
//                }
//              } //: tabView
//              .tabViewStyle(PageTabViewStyle())
//              .frame(minHeight: 148, idealHeight: 168, maxHeight: 180)
//            } //: box
            
            // Description
            
            Group {
                HeadingView(HeadingImage: "info.circle", HeadingText: "All about \(animal.name)")
              
              Text(animal.description)
                .multilineTextAlignment(.leading)
               .layoutPriority(1)
            }
            .padding(.horizontal)
            //Map
            
            Group{HeadingView(HeadingImage: "map", HeadingText: "National park")
                InsertMapView()
            }.padding(.horizontal)
            
            //link
            Group{HeadingView(HeadingImage: "books.vertical", HeadingText: "Learn More")
             ExternalWebLinkView(animal: animal)
                
            }.padding(.horizontal)
            
            
                
        }
        .navigationBarTitle("Learn about \(animal.name)")
    .navigationBarTitleDisplayMode(.inline)
    }
}
}

struct AnimalDetailView_Previews: PreviewProvider {
    static let animals: [Animal] = Bundle.main.decode(file: "animals.json")
    
    static var previews: some View {
        AnimalDetailView(animal: animals[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

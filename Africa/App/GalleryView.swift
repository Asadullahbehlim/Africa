//
//  GalleryView.swift
//  Africa
//
//  Created by Asadullah Behlim on 05/04/22.
//

import SwiftUI

struct GalleryView: View {
    // MARK: - property
    @State private var selectedAnimal = "lion"
    
    let animals: [Animal] = Bundle.main.decode(file: "animals.json")
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    
// MARK: - Simp grid
//    let gridLayout : [GridItem] = Array(repeating: GridItem(.flexible()), count: 3)
    // MARK: - Dynamic grid
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    
    @State private var gridColumn: Double = 3.0
    
    func gridSwitch() {
        gridLayout = Array(repeating: .init(.flexible()), count: Int(gridColumn))
    
    }
    
    // MARK: - body
    var body: some View {
      
        ScrollView(.vertical, showsIndicators: false) {
            
            VStack(alignment: .center, spacing: 30) {
                Image(selectedAnimal)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 1))
                  
                // MARK: - slider
          
                Slider(value: $gridColumn, in: 2...4, step: 1)
                  .padding(.horizontal)
                  .onChange(of: gridColumn, perform: { value in
                    gridSwitch()
                  })
                
                // MARK: - grid
                
            LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                ForEach(animals) { item in
                    Image(item.image)
                        .resizable()
                        .scaledToFit()
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white, lineWidth: 1))
                        .onTapGesture {
                            selectedAnimal = item.image
                            haptics.impactOccurred()
                        }
                }
            } // lazy grid
            .animation(.easeOut)
            .onAppear(perform: { gridSwitch()
                // MARK: - Grid
            })
            }.padding(.horizontal, 10)
                .padding(.vertical, 50)
         
    } // Scroll
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(MotionAnimationView())
}
}
struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}


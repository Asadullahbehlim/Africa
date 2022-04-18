//
//  ContentView.swift
//  Africa
//
//  Created by Asadullah Behlim on 04/04/22.
//

import SwiftUI

struct ContentView: View {
    let animals: [Animal] = Bundle.main.decode(file: "animals.json")
    
    @State private var isGridViewActive: Bool = false
//    @State private var gridColumn: Int = 1
    @State private var gridLayout: [GridItem] = [ GridItem(.flexible()) ]
    @State private var toolbarIcon: String = "square.grid.2x2"
    func gridSwitch () {
        gridLayout = Array(repeating: .init(.flexible()), count: gridLayout.count % 3 + 1)
//        gridColumn = gridLayout.count
        switch gridLayout.count {
        case 1:
          toolbarIcon = "rectangle.grid.1x2"
        case 2:
          toolbarIcon = "square.grid.2x2"
        case 3:
          toolbarIcon = "square.grid.3x2"
        default:
          toolbarIcon = "square.grid.2x2"
        }
      }
    
    var body: some View {
        NavigationView {
            Group {
                if !isGridViewActive {
                List {
                    CoverImageView()
                        .frame(height: 300)
                        .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                    
                    ForEach (animals) { animal in
                        NavigationLink(destination: AnimalDetailView(animal: animal)) {
                            
                            AnimalRowView(animal: animal)
                        }
                    }
                    CreditsView()
                        .modifier(CenterModifier())
    //              .frame(maxWidth: .infinity, alignment: .center)
    //          ( Frame method is best )
                } //: List End
                } else {
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVGrid (columns: gridLayout, alignment: .center, spacing: 10) {
                            ForEach(animals) { animal in
                                NavigationLink(destination: AnimalDetailView(animal: animal)) {
                                    AnimalGridItemView(animal: animal)
                                }
                        }
                        }.padding(15)
                       .animation(.easeIn)
                }
                }
            } // Group
            .navigationBarTitle("Africa", displayMode: .large)
        .toolbar { ToolbarItem(placement: .navigationBarTrailing) {
            HStack(spacing: 16) {
                Button(action: {
                    print("List view is activated")
                    isGridViewActive = false
                    toolbarIcon = "square.grid.2x2"
                })
                {
                    Image(systemName: "square.fill.text.grid.1x2")
                      .font(.title2)
                      .foregroundColor(isGridViewActive ? .primary : .accentColor)
                }
                Button(action: {
                    print("Grid view is activated")
                    isGridViewActive = true
                    gridSwitch()
                })
                {
                    Image(systemName: toolbarIcon)
                      .font(.title2)
                      .foregroundColor(isGridViewActive ? .accentColor : .primary)
                }
            }
        }
}
}
}
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


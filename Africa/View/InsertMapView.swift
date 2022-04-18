//
//  InsertMapView.swift
//  Africa
//
//  Created by Asadullah Behlim on 09/04/22.
//

import SwiftUI
import MapKit


struct InsertMapView: View {
    
    // MARK: - property
    
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599), span: MKCoordinateSpan(latitudeDelta: 60.0, longitudeDelta: 60.0))
    
    // MARK: - Body
    
    var body: some View {
      Map(coordinateRegion: $region)
        .overlay(
          NavigationLink(destination: MapView()) {
            HStack {
              Image(systemName: "mappin.circle")
                .foregroundColor(Color.white)
                .imageScale(.large)
              
              Text("Locations")
                .foregroundColor(.accentColor)
                .fontWeight(.bold)
                
            } // hstack
            .padding(.vertical, 10)
            .padding(.horizontal, 14)
            .background(
              Color.black
                .opacity(0.4)
                .cornerRadius(8)
            )
          } //: navig
          .padding(12)
          , alignment: .topTrailing
        )
        .frame(height: 256)
        .cornerRadius(12)
    }
  }
struct InsertMapView_Previews: PreviewProvider {
    static var previews: some View {
        InsertMapView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

//
//  CreditsView.swift
//  Africa
//
//  Created by Asadullah Behlim on 17/04/22.
//

import SwiftUI

struct CreditsView: View {
    var body: some View {
        VStack {
            Image("compass")
                .resizable()
                .scaledToFit()
                .frame(width: 128, height: 128)
 Text("""
 Copyright © Asad
 All Rights Reserved
 """)
        .font(.footnote)
        .multilineTextAlignment(.center)
    }
        .padding()
        .opacity(0.4)
}
}
struct CreditsView_Previews: PreviewProvider {
    static var previews: some View {
        CreditsView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

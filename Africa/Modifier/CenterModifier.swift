//
//  CenterModifier.swift
//  Africa
//
//  Created by Asadullah Behlim on 17/04/22.
//

import SwiftUI
struct CenterModifier: ViewModifier {
    func body(content: Content) -> some View {
        HStack {
            Spacer()
            content
            Spacer()
        }
    }
}

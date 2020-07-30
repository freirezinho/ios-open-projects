//
//  InfoView.swift
//  SauloCard
//
//  Created by mac on 19/06/20.
//  Copyright © 2020 Saulo Freire. All rights reserved.
//

import SwiftUI

struct InfoView: View {
    let text: String
    let imageName: String
    var body: some View {
        ZStack {
            Capsule().frame(height: 50, alignment: .center)
                .colorInvert()
            HStack{
                Image(systemName: imageName)
                    .foregroundColor(.green)
                Text(text)
            }
        }
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView(text: "555-555-555", imageName: "phone.fill")
            .previewLayout(.sizeThatFits)
    }
}

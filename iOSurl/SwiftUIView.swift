//
//  SwiftUIView.swift
//  iOSurl
//
//  Created by Mike Chirico on 10/18/20.
//

import SwiftUI

struct SwiftUIView: View {
    
    var count: Int
    var onDismiss: () -> ()
    var body: some View {
        Text("Stepper: \(self.count)")
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView(count: 0, onDismiss: {print("hi")})
    }
}

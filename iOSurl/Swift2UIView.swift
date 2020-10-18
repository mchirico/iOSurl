//
//  Swift2UIView.swift
//  iOSurl
//
//  Created by Mike Chirico on 10/18/20.
//

import SwiftUI

struct Swift2UIView: View {
    
    var count: Int
    var onDismiss: () -> ()
    var body: some View {
        Text("2 Stepper: \(self.count)")
    }
}

struct Swift2UIView_Previews: PreviewProvider {
    static var previews: some View {
        Swift2UIView(count: 0, onDismiss: {print("hi")})
    }
}

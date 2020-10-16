//
//  ContentView.swift
//  iOSurl
//
//  Created by Mike Chirico on 10/16/20.
//

import SwiftUI

struct ContentView: View {
    @State var count: Int64 = 0
    @State var label0: String = "Label "
    var body: some View {
        VStack{
            HStack {
                VStack {
                    GroupBox(label: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Label@*/Text(self.label0)
                                .padding(.leading)/*@END_MENU_TOKEN@*/) {
                        /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Content@*/Text("Data...")
                            .fontWeight(.heavy)/*@END_MENU_TOKEN@*/
                    }
                    Stepper(value: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant(4)/*@END_MENU_TOKEN@*/, in: 0...100) {
                        /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Label@*/Text("Count")/*@END_MENU_TOKEN@*/
                    }
                    Button(action: {
                        self.count += 1
                        self.label0 = "Count: \(self.count)"
                    }) {
                        Text("Button 0")
                            .foregroundColor(Color.green)
                            .multilineTextAlignment(.center)
                            
                    }
                }
                Spacer()
            }
            Divider()
            Text("Hello, world!")
                .padding()
            Spacer()
        }}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

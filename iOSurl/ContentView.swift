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
    @State var data: String = "Data..."
    var body: some View {
        VStack{
            HStack {
                VStack {
                    GroupBox(label: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Label@*/Text(self.label0)
                                .padding(.leading)/*@END_MENU_TOKEN@*/) {
                        /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Content@*/Text(self.data)
                            
                            .fontWeight(.heavy)/*@END_MENU_TOKEN@*/
                            .padding([.leading,.trailing],20)
                            .padding([.top,.bottom],10)
                            .background(Color.blue)
                            .foregroundColor(Color.yellow)
                            .cornerRadius(15)
                            .shadow(radius: 15)
                    }
                    Stepper(value: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant(4)/*@END_MENU_TOKEN@*/, in: 0...100) {
                        /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Label@*/Text("Count")/*@END_MENU_TOKEN@*/
                            .padding([.leading,.trailing],20)
                            .padding([.top,.bottom],10)
                            .background(Color.blue)
                            .foregroundColor(Color.yellow)
                            .cornerRadius(15)
                            .shadow(radius: 15)
                    }
                    Button(action: {
                        self.count += 1
                        
                        // Example 1
                        // mySession(url: "https://aibot.cwxstat.io/")
                        
                        
                        // Example 2 Completion Handler
                        let queue = OperationQueue()
                        queue.addOperation {
                            let sess = Session(url: "https://aibot.cwxstat.io/")
                            sess.Get(){ result in
                                print(result)
                                DispatchQueue.main.async {
                                    self.label0 =  result
                                    self.data = result
                                }
                                
                            } onFailure: {
                                print("Couldn't download the next picture.")
                            }
                        }
                        
                        
                    }) {
                        Text("Button 0")
                            .padding([.leading,.trailing],20)
                            .padding([.top,.bottom],10)
                            .background(Color.red)
                            .foregroundColor(Color.yellow)
                            .cornerRadius(15)
                            .shadow(radius: 15)
                            .multilineTextAlignment(.center)
                        
                    }
                }
                Spacer()
            }
            Divider()
            Text("Count: \(self.count)")
                .padding([.leading,.trailing],20)
                .padding([.top,.bottom],10)
                .background(Color.blue)
                .foregroundColor(Color.yellow)
                .cornerRadius(15)
                .shadow(radius: 15)
                .padding()
            Spacer()
        }}
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

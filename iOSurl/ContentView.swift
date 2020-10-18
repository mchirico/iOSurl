//
//  ContentView.swift
//  iOSurl
//
//  Created by Mike Chirico on 10/16/20.
//

import SwiftUI


public var screenWidth: CGFloat {
    return UIScreen.main.bounds.width
}

public var screenHeight: CGFloat {
    return UIScreen.main.bounds.height
}

struct ContentView: View {
    @State var count: Int64 = 0
    @State var label0: String = "Label "
    @State var data: String = "Data..."
    @State var stepper = 0
    @State var jumpToSegue: Bool = false
    @State var jumpToSegue2: Bool = false
    
    @State var viewState = CGSize(width: screenWidth, height: 0)
    @State var MainviewState = CGSize.zero
    
    @State var sliderValue: Double = 30
    @State var sliderValue2: Double = 17
    
    
    struct CustomStyle0: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .padding([.top,.bottom,.leading],10)
                .padding([.trailing],14)
                .background(Color.blue)
                .foregroundColor(Color.yellow)
                .cornerRadius(15)
                .shadow(radius: 15)
                .font(Font.custom("Avenir-Black", size: 17))
            
        }
    }
    
    struct CustomStyle1: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .padding([.leading,.trailing],30)
                .padding([.top,.bottom],20)
                .background(Color.orange)
                .foregroundColor(Color.black)
                .cornerRadius(25)
                .shadow(radius: 25)
                .font(Font.custom("Avenir-Black", size: 17))
            
        }
    }
    
    
    var body: some View {
        VStack {
            
            VStack {
                Text("Slider: \(self.sliderValue)")
                Text("Slider2: \(self.sliderValue2)")
                Slider(value: self.$sliderValue, in: 1...100)
                Slider(value: self.$sliderValue2, in: 1...100)
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
                            Stepper(value: $stepper, in: 0...100) {
                                Text("Count \(self.stepper)").modifier(CustomStyle0())
                                
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
                                Text("HTTP GET")
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
                    HStack {
                        VStack {
                            GroupBox(label: Text("Section")
                                        .padding([.leading,.trailing],20)
                                        .padding([.top,.bottom],10)
                                        .background(Color.green)
                                        .foregroundColor(Color.black)
                                        .cornerRadius(5)
                                        .shadow(radius: 5)
                                        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                                        .multilineTextAlignment(.center)
                            )
                            {
                                
                                
                                HStack {
                                    
                                    Button(action: {
                                        self.jumpToSegue = true
                                    }) {
                                        Text("Go to Segue").modifier(CustomStyle1())
                                        
                                    }.sheet(isPresented: $jumpToSegue) {
                                        SwiftUIView(count: self.stepper, onDismiss:{
                                                        self.status()} )
                                    }
                                    .padding([.leading,.trailing],20)
                                    .padding([.top,.bottom],10)
                                    .background(Color.red)
                                    .foregroundColor(Color.black)
                                    .cornerRadius(15)
                                    .shadow(radius: 15)
                                    .multilineTextAlignment(.center)
                                    
                                    Button(action: {
                                        self.jumpToSegue2 = true
                                    }) {
                                        Text("Go to Segue 2")
                                            .padding([.leading,.trailing],30)
                                            .padding([.top,.bottom],20)
                                            .background(Color.orange)
                                            .foregroundColor(Color.black)
                                            .cornerRadius(25)
                                            .shadow(radius: 25)
                                        
                                    }.sheet(isPresented: $jumpToSegue2) {
                                        Swift2UIView(count: self.stepper, onDismiss:{
                                                        self.status()} )
                                    }
                                    
                                    .padding([.leading,.trailing],20)
                                    .padding([.top,.bottom],10)
                                    .background(Color.green)
                                    .foregroundColor(Color.black)
                                    .cornerRadius(15)
                                    .shadow(radius: 15)
                                    .multilineTextAlignment(.center)
                                }
                            }
                            
                        }
                        Spacer()
                    }
                }
            }
        }}
    
    func status(){
        
        self.viewState = CGSize(width: 0, height: 0)
        self.MainviewState = CGSize(width: 0, height: screenHeight)
        
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

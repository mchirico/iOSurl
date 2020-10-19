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
    
    @State var result = [String]()
    
    var body: some View {
        VStack {
            ScrollView(.horizontal) {
                HStack(spacing: 20) {
                        ForEach(0..<10) {
                            Text("Item \($0)")
                                .foregroundColor(.white)
                                .font(.largeTitle)
                                .frame(width: 200, height: 200)
                                .background(Color.red)
                        }
                    }
            }
            VStack {
                Text("Buttons: \(self.count)")
                
                Button(action: {

                    GetAddData(){ result in
                        print(result)
                        DispatchQueue.main.async {
                            self.result =  result
                            for i in self.result {
                                print(i)
                            }
                           
                        }
                        
                    } onFailure: {
                        print("Couldn't download the content.")
                    }
                    
                }) {
                    Text("SQL button")
                } .padding([.leading,.trailing],30)
                .padding([.top,.bottom],20)
                .background(Color.orange)
                .foregroundColor(Color.black)
                .cornerRadius(25)
                .shadow(radius: 25)
                .font(Font.custom("Avenir-Black", size: 17))
                
                
                Button(action: {

                    ClearGetAddData(){ result in
                        print(result)
                        DispatchQueue.main.async {
                            self.result =  result
                            for i in self.result {
                                print(i)
                            }
                           
                        }
                        
                    } onFailure: {
                        print("Couldn't download the content.")
                    }
                    
                }) {
                    Text("Clear")
                } .padding([.leading,.trailing],30)
                .padding([.top,.bottom],20)
                .background(Color.orange)
                .foregroundColor(Color.black)
                .cornerRadius(25)
                .shadow(radius: 25)
                .font(Font.custom("Avenir-Black", size: 17))
                
                
                
                
            }
            if self.result.count > 3 {
                Text("here: \(self.result[3])")
            }

        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView(count: 0, onDismiss: {print("hi")})
    }
}



func GetAddData(completion:   (_ result: [String])  -> Void, onFailure: () -> Void)  {
    var output = [String]()
    
    let db = SqliteBroker()

    let table = "swiftUIView.sqlite"
    var scmd = "create table IF NOT EXISTS junk (id int, msg text, row int, timeStamp text)"
    db.sqlExe(table: table,stmt: scmd)
    
    let timestamp = NSDate().timeIntervalSince1970
    scmd = "insert into junk (id,msg,row,timeStamp) values (0,'worked',1,'\(timestamp)')"
    db.sqlExe(table: table,stmt: scmd)
    
    scmd = "select * from junk"
    let result = db.sqlQuery(table: table, stmt: scmd)
    for row in result {
        output.append("\(row.id) \(row.timeStamp)")
    }
    completion(output)
}

func ClearGetAddData(completion:   (_ result: [String])  -> Void, onFailure: () -> Void)  {
    var output = [String]()
    
    let db = SqliteBroker()

    let table = "swiftUIView.sqlite"
    var scmd = "drop table IF EXISTS junk"
    db.sqlExe(table: table,stmt: scmd)
    

    scmd = "create table IF NOT EXISTS junk (id int, msg text, row int, timeStamp text)"
    db.sqlExe(table: table,stmt: scmd)
    
    
    db.sqlExe(table: table,stmt: scmd)
    
    let timestamp = NSDate().timeIntervalSince1970
    scmd = "insert into junk (id,msg,row,timeStamp) values (0,'worked',1,'\(timestamp)')"
    db.sqlExe(table: table,stmt: scmd)
    
    scmd = "select * from junk"
    let result = db.sqlQuery(table: table, stmt: scmd)
    for row in result {
        output.append("\(row.id) \(row.timeStamp)")
    }
    completion(output)
}

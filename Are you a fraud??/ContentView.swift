//
//  ContentView.swift
//  Are you a fraud??
//
//  Created by Yuhan Du on 17/2/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var inputIC: String = ""
    
    var body: some View {
        VStack {
            TextField("Enter your text field here", text: $inputIC, prompt: Text("Enter your supposed IC number here: "))
                .textFieldStyle(.roundedBorder)
                .onSubmit {
                    let icButArray = Array(inputIC.uppercased())
                    
                    print(checkICValidation(prefix: String(icButArray[0]), array: icButArray.map{String($0)}, suffix: String(icButArray[icButArray.count - 1])))
                }
            
            
        }
        .padding()
    }
}

func checkICValidation(prefix: String, array: [String], suffix: String) -> Bool {
    var arrayButInt: [Int] {
        array.compactMap{Int($0)}
    }
    let sum = arrayButInt[0] * 9 + arrayButInt[1] * 4 + arrayButInt[2] * 5 + arrayButInt[3] * 6 + arrayButInt[4] * 7 + arrayButInt[5] * 8 + arrayButInt[6] * 9
    
    var mapping = ""
    
    switch (prefix) {
    case "S":
        mapping = "JABCDEFGHIZ"
        
    case "T":
        mapping = "GHIZJABCDEF"
        
    case "F":
        mapping = "XKLMNPQRTUW"
        
    case "G":
        mapping = "RTUWXKLMNPQ"
        
    default: break
    }
    
    let correctSuffix = String(Array(mapping)[sum % 11])
    return suffix == correctSuffix
}

//
//  ContentView.swift
//  SplitTips
//
//  Created by  Mr.Ki on 02.06.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var checkAmount = ""
    @State private var numberOfPeole = 2
    @State private var tipPercentage = 0
    
    let tipPercentages = [0, 5, 10, 15, 20, 25]
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeole + 2)
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        return amountPerPerson
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", text: $checkAmount)
                    Picker(selection: $numberOfPeole) {
                        ForEach(2..<50) {
                            Text("\($0) people")
                        }
                    } label: {
                        Text("Number of people")
                    }
                    
                }
                Section {
                    Picker(selection: $tipPercentage, content: {
                        ForEach(0..<tipPercentages.count) {
                            Text("\(tipPercentages[$0])%")
                        }
                    }, label: { Text("Tip percentage")})
                } header: {
                    Text("How many tips?")
                }
                .pickerStyle(.segmented)
                Section {
                    
                    Text("\(totalPerPerson, specifier: "%.2f")")
                }
            }
            .navigationTitle("Split tips")
            
            
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

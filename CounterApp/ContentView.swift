//
//  ContentView.swift
//  CounterApp
//
//  Created by Ykylas Nurkhan on 08.10.2024.
//

import SwiftUI

struct CustomSwitchToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.label
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .fill(configuration.isOn ? Color.orange : Color.white)
                    .frame(width: 80, height: 45)
                    .shadow(radius: 3)
                
                HStack {
                    if configuration.isOn {
                        Spacer()
                        Image(systemName: "moon.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 40, height: 40)
                            .foregroundColor(.white)
                    } else {
                        Image(systemName: "sun.max.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 40, height: 40)
                            .foregroundColor(.orange)
                        Spacer()
                    }
                }
                .padding(.horizontal, 10)
                
                Circle()
                    .fill(configuration.isOn ? Color.white : Color.black)
                    .frame(width: 22, height: 22)
                    .offset(x: configuration.isOn ? 20 : -20)
                    .animation(.easeInOut, value: configuration.isOn)
            }
            .onTapGesture {
                withAnimation {
                    configuration.isOn.toggle()
                }
            }
        }
    }
}

struct ContentView: View {
    @State private var counter = 0
    @State private var isDarkMode = false
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: isDarkMode ? [Color.black, Color.gray] : [Color.purple, Color.blue]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack {
                    Spacer()
                    Toggle(isOn: $isDarkMode) {
                        Text("")
                    }
                    .toggleStyle(CustomSwitchToggleStyle())
                    .padding()
                }
                
                Spacer()
                
                Text("\(counter)")
                    .font(.system(size: 100, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
                    .padding(.bottom, 50)
                
                Spacer()
                
                HStack(spacing: 40) {
                    Button(action: {
                        counter += 1
                    }) {
                        Text("+")
                            .font(.largeTitle)
                            .frame(width: 80, height: 80)
                            .foregroundColor(.white)
                            .background(Color.green)
                            .cornerRadius(40)
                    }
                    
                    Button(action: {
                        counter = 0
                    }) {
                        Text("Сброс")
                            .font(.title2)
                            .frame(width: 80, height: 80)
                            .foregroundColor(.white)
                            .background(Color.red)
                            .cornerRadius(40)
                    }
                }
                .padding()
            }
        }
        .preferredColorScheme(isDarkMode ? .dark : .light)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .preferredColorScheme(.light)
            ContentView()
                .preferredColorScheme(.dark)
        }
    }
}






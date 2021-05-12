//
//  ContentView.swift
//  Weather
//
//  Created by Sachin Bharadwaj on 12/05/21.
//

import SwiftUI

struct ContentView: View {
    @State var isNight = false
    
    var weatherForecast: [DayWeather] = [DayWeather(id: 0, day: "tue", icon: "sun.max.fill", temperature: 35), DayWeather(id: 1, day: "wed", icon: "wind", temperature: 37), DayWeather(id: 2, day: "thu", icon: "sun.max.fill", temperature: 37), DayWeather(id: 3, day: "fri", icon: "sun.max.fill", temperature: 26), DayWeather(id: 4, day: "sat", icon: "sun.max.fill", temperature: 26), DayWeather(id: 5, day: "sun", icon: "sun.max.fill", temperature: 34)]
    
    var body: some View {
        VStack {
            ZStack {
                BackgroundGradient(isNight: $isNight)
                Spacer()
                VStack {
                    TitleView(title: "Mangalore, DK")
                    CurrentWeatherView(icon: "cloud.sun.fill", temperature: 72)
                    Spacer()
                    HStack(spacing: 20) {
                        ForEach(weatherForecast, id: \.self) { weather in
                            DayWeatherView(dayOfTheWeek: weather.day, iconName: weather.icon, temparature: weather.temperature)
                        }
                    }
                    Spacer()
                    CustomButton(title: "Change Day Time", action: {
                        print("You've tapped this button")
                    })
                    Spacer()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct DayWeather: Hashable, Codable {
    
    var id: Int
    let day: String
    let icon: String
    let temperature: Int
}

struct BackgroundGradient: View {
    
    @Binding var isNight: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [Color("startingColor"), Color("endingColor")]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .ignoresSafeArea()
    }
}

struct DayWeatherView: View {
    
    var dayOfTheWeek: String
    var iconName: String
    var temparature: Int
    
    var body: some View {
        VStack {
            Text(dayOfTheWeek).textCase(.uppercase)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
            Image(systemName: iconName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40, alignment: .center)
            Text("\(temparature)°")
                .font(.body).bold()
                .foregroundColor(.white)
            
        }
    }
}

struct CurrentWeatherView: View {
    
    var icon: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 5.0) {
            Image(systemName: icon)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180, alignment: .center)
            Text("\(temperature)°")
                .font(.system(size: 70))
                .fontWeight(.medium)
                .foregroundColor(.white)
        }
    }
}

struct TitleView: View {
    
    var title: String
    
    var body: some View {
        Text(title)
            .font(.title2)
            .fontWeight(.medium)
            .foregroundColor(.white)
            .padding()
    }
}

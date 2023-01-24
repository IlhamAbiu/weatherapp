//
//  WeatherView.swift
//  Weather
//
//  Created by Ilgam Khasanov on 17.01.2023.
//

import SwiftUI

struct WeatherView: View {
    var weather: ResponseBody
    var body: some View {
        ZStack(alignment: .leading){
            VStack{
                VStack(alignment: .leading, spacing: 5){
                    Text(weather.name).bold().font(.title)
                    Text("Сегодня,\(Date().formatted(.dateTime.month().day().hour().minute()))")
                        .fontWeight(.light)
                }.frame(maxWidth: .infinity,alignment: .leading)
                
                Spacer()
                
                VStack{
                    HStack{
                        VStack(spacing:20){
                            Image(systemName: "sun.max")
                                .font(.system(size: 50 ))
                            Text (weather.weather[0].main)
                        }.frame(width: 150,alignment: .leading)
                        
                        Spacer().frame(width: 4)
                        
                        Text(weather.main.feelsLike.roundDouble() + "º")
                            .font(.system(size: 100))
                            .fontWeight(.bold)
                            .padding()
                    }
                    
                    //Spacer().frame(height: 60)
                    
                    AsyncImage(url: URL(string: "https://pngimg.com/uploads/city/city_PNG38.png")) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 350)
                    } placeholder: {
                        ProgressView()
                    }
                    
                    Spacer()
                    
                    
                }.frame(maxWidth: .infinity)
            }.padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                
            VStack{
                Spacer()
                VStack(alignment: .leading, spacing: 20){
                    Text("Погода сейчас")
                        .bold().padding(.bottom)
                    HStack{
                        WeatherRow(logo: "thermometer.low", name: "Мин температура", value: (weather.main.tempMin.roundDouble()) + "º")
                        Spacer()
                        WeatherRow(logo: "thermometer.high", name: "Макс температура", value: (weather.main.tempMax.roundDouble()) + "º")
                    }
                    HStack{
                        WeatherRow(logo: "wind", name: "Скорость ветра", value: (weather.wind.speed.roundDouble()) + " м/с")
                        Spacer()
                        WeatherRow(logo: "humidity", name: "Влажность              ", value: (weather.main.humidity.roundDouble()) + " %")
                    }
                }.frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .padding(.bottom, 20)
                    .foregroundColor(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
                    .background(.white)
                    .cornerRadius(20, corners: [.topRight, .topLeft])
            }
            
        }.edgesIgnoringSafeArea(.bottom)
        .background(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
        .preferredColorScheme(.dark)
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(weather: previewWeather)
    }
}

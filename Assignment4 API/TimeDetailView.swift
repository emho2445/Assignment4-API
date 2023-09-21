//
//  TimeDetailView.swift
//  Assignment4 API
//
//  Created by Emma  Hopson on 9/21/23.
//

import SwiftUI

struct TimeDetailView: View {
    
    let suntimes: LocationTimes
    
    var body: some View {
        NavigationView{
            ZStack(content: {
                Image("Earth")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                Rectangle()
                    .colorInvert()
                    .frame(height: 300)
                    .opacity(0.70)
                VStack{
                    Text("Sunrise: \(suntimes.results.sunrise)")
                    Text("Sunset: \(suntimes.results.sunset)")
                    Text("Solar Noon: \(suntimes.results.solar_noon)")
                    Text("Day Length: \(suntimes.results.day_length)")
                    Text("Civil Twilight Start: \(suntimes.results.civil_twilight_begin)")
                    Text("Civil Twilight End: \(suntimes.results.civil_twilight_end)")
                    Text("Nautical Twilight Start: \(suntimes.results.nautical_twilight_begin)")
                    Text("Nautical Twilight End: \(suntimes.results.nautical_twilight_end)")
                    Text("Astronomical Twilight Start: \(suntimes.results.astronomical_twilight_begin)")
                    Text("Astronomical Twilight End: \(suntimes.results.astronomical_twilight_end)")
                }

            })
            
        }
        .navigationTitle("")
        .toolbarBackground(.visible, for: .navigationBar)
        .toolbarColorScheme(.dark, for: .navigationBar)
        
        //.foregroundColor(.white)
    }
}

struct TimeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TimeDetailView(suntimes: LocationTimes(results: SunDetails(sunrise: "", sunset: "", solar_noon: "", day_length: "", civil_twilight_begin: "", civil_twilight_end: "", nautical_twilight_begin: "", nautical_twilight_end: "", astronomical_twilight_begin: "", astronomical_twilight_end: ""), status: ""))
    }
}


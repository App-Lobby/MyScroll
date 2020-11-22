//
//  ContentView.swift
//  MyScroll
//
//  Created by mohammad yasir on 22/11/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            HStack{
                Text("Scroll View")
                    .font(.system(size: 28, weight: .bold))
                Spacer()
                
                Image(systemName: "bell")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .aspectRatio(contentMode: .fit)
                    .padding(.trailing , 5)
            }
            .padding(.horizontal)
            .padding(.leading , 14)
            .padding(.top, 30)
            
            
            ScrollView(.horizontal, showsIndicators: false) {
                VStack {
                    HStack(spacing : 30) {
                        ForEach(sectionData) { item in
                            GeometryReader { geometry in
                                CardView(section: item)
                                    .rotation3DEffect(Angle(degrees: Double(geometry.frame(in: .global).minX - 30) / -20), axis: (x: 20, y: 10.0, z: 20))
                            }.frame(width: 275 , height : 275)
                        }
                    }
                    .padding(30)
                    .padding(.bottom,30)
                    
                    
                }
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing : 30) {
                    ForEach(sectionData.reversed()) { item in
                        GeometryReader { geometry in
                            CardView(section: item)
                                .rotation3DEffect(Angle(degrees: Double(geometry.frame(in: .global).minX - 30) / -20), axis: (x: 20, y: 10.0, z: 20))
                        }.frame(width: 275 , height : 275)
                    }
                }
                .padding(30)
                .padding(.bottom,30)
            }
            
            
            
            Spacer()
        }
        .padding(.top,30)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CardView: View {
    
    var section : Section
    
    var body: some View {
        VStack{
            HStack(alignment:.top){
                Text(section.title)
                    .font(.system(size: 24, weight: .bold))
                    .frame(width: 160, alignment: .leading)
                    .foregroundColor(.white)
                Spacer()
                Image(systemName: section.logo)
                    .foregroundColor(.white)
            }
            
            Text(section.text)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity , alignment: .leading)
                .foregroundColor(.white)
            
            section.image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width:210)
            
        }
        .padding(.top,20)
        .padding(.horizontal,20)
        .frame(width: 275, height: 275)
        .background(section.color)
        .cornerRadius(30)
        .shadow(color: section.color.opacity(0.3), radius: 20, x: 0, y: 20)
    }
}


struct Section : Identifiable {
    var id = UUID()
    var title : String
    var text : String
    var logo : String
    var image : Image
    var color : Color
}

let sectionData = [
    Section(title: "Here will be your title ", text: "SUBTITIEL", logo: "paperplane", image: Image(uiImage: #imageLiteral(resourceName: "img1")), color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))),
    Section(title: "Here will be your title ", text: "SUBTITIEL", logo: "pencil.slash", image: Image(uiImage: #imageLiteral(resourceName: "img2")), color: Color(#colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1))),
    Section(title: "Here will be your title ", text: "SUBTITIEL", logo: "square.and.arrow.up", image: Image(uiImage: #imageLiteral(resourceName: "img4")), color: Color(#colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1))),
    Section(title: "Here will be your title ", text: "SUBTITIEL", logo: "folder", image: Image(uiImage: #imageLiteral(resourceName: "img5")), color: Color(#colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)))
]




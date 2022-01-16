
//add preset font and opacity?????
//fix spacing with image
//add properties + fix spacing with app icon

import Foundation
import SwiftUI

enum Category {
    case Listening, Speech, Spelling
}

extension Color {
    static let teal = Color(red: 49 / 255, green: 163 / 255, blue: 159 / 255)
    static let darkPink = Color(red: 208 / 255, green: 45 / 255, blue: 208 / 255)
}

struct TodayPageModel: View {
    var date = Date()
    var body: some View {
        ScrollView {
            //alignment
            VStack(alignment: .leading) {
                HStack {
                    VStack(alignment: .leading) {
                        //MAKE DYNAMIC
                        Text("Saturday, January 15").foregroundColor(.gray).bold().font(Font.footnote)
                        Text("Today").bold().font(Font.largeTitle)
                    }
                    Spacer()
                    Button {
                        self.loadProfile()
                    } label: {
                        Image("Profile").resizable().frame(width: 50, height: 50, alignment: .trailing)
                    }.accentColor(.blue)

                }.padding([.leading, .trailing, .top])

                OutlineView(outlineColor: .teal, withImage: Image("Hotel Transylvania"), name: "NFL Clash", message: "Head-to-head football action!")
                
                BoxView(boxColor: .black, withImage: Image("Turkey"), name: "NFL Clash", message: "Head-to-head football action!")
                
                HighlightView(gradientColor: .purple, withImage: Image("Fruit"), name: "Fruits", message: "These are good for you")
            }
        }
    }
    
    func loadProfile() {
        
    }
}

struct HighlightView: View {
    var category: [Category]
    var gradientColor: Color
    var withImage: Image
    var name: String
    var message: String
    
    init(gradientColor: Color, withImage: Image, name: String = "", message: String = "", category: [Category] = []) {
        self.gradientColor = gradientColor
        self.withImage = withImage
        self.name = name
        self.message = message
        self.category = category
    }
    
    var body: some View {
        VStack {
            ZStack {
                //fix later
                withImage.resizable().aspectRatio(contentMode: .fit)
                LinearGradient(gradient: Gradient(colors: [.clear, gradientColor.opacity(1)]), startPoint: .top, endPoint: .bottom)
                HStack {
                    VStack(alignment: .leading) {
                        Text("CATEGORY PLACEHOLDER").foregroundColor(.white.opacity(0.5)).font(.system(size: 15)).bold()
//                            .padding(.bottom, 1)
                        Text(name).foregroundColor(.white).font(.system(size: 30)).bold()
                        Spacer()
                        Text(message).foregroundColor(.white)
                    }.padding(30)
                    Spacer()
                }
                .padding(0.0)
            }
        }.cornerRadius(30).padding().shadow(radius: 5)
    }
}

struct BoxView: View {
    var category: [Category]
    var boxColor: Color
    var withImage: Image
    var name: String
    var message: String
    
    init(boxColor: Color, withImage: Image, name: String = "", message: String = "", category: [Category] = []) {
        //add app icon property
        self.boxColor = boxColor
        self.withImage = withImage
        self.name = name
        self.message = message
        self.category = category
    }
    
    var body: some View {
        VStack {
            ZStack(alignment: .leading) {
                //fix later
                withImage.resizable().frame(height: 500).aspectRatio(contentMode: .fit)
                
                LinearGradient(gradient: Gradient(colors: [.clear, boxColor.opacity(1)]), startPoint: .top, endPoint: .bottom)
                
                    VStack(alignment: .leading) {
                        Text("CATEGORY PLACEHOLDER").foregroundColor(.white.opacity(0.5)).font(.system(size: 15)).bold()
                            .padding([.top, .leading, .trailing], 30)
                        Text(name).foregroundColor(.white).font(.system(size: 30)).bold()
                            .padding([.leading, .trailing], 30)
                        Spacer()
                        
                        ZStack {
                          ContainerRelativeShape()
                                .fill(boxColor)
                                .frame(maxWidth: .infinity, maxHeight: 75)
                                .shadow(radius: 5)
//                              .edgesIgnoringSafeArea(.all)
                            
                            HStack {
                                Image("AppDemo").resizable().frame(width: 45, height: 45)
                                
                                VStack(alignment: .leading) {
                                    Text(name).font(.system(size: 18)).bold()
                                    Text(message).font(.system(size: 15))
                                    
                                }.foregroundColor(.white)
                                 
                                
                                VStack {
                                    Button {
                                        print("Button pressed")
                                    } label: {
                                        Text("GET").bold()
                                            .padding(.horizontal, 20)
                                            .padding(.vertical, 5)
                                            .background(Color.white)
                                            .cornerRadius(40)
                                            
                                    }
                                    
                                    Text("In-App purchases").font(.system(size: 10))
                                        .foregroundColor(.white)
                                }
                            }
                          
                        }
                    }
            }
        }.cornerRadius(30).padding().shadow(radius: 5)
    }
}

//MARK: - OUTLINE VIEW

struct OutlineView: View {
    var category: [Category]
    var outlineColor: Color
    var withImage: Image
    var name: String
    var message: String
    
    init(outlineColor: Color, withImage: Image, name: String = "", message: String = "", category: [Category] = []) {
        //add app icon property
        self.outlineColor = outlineColor
        self.withImage = withImage
        self.name = name
        self.message = message
        self.category = category
    }
    
    var body: some View {
        VStack {
            ZStack(alignment: .leading) {
                //fix later
                withImage.resizable().frame(height: 500).aspectRatio(contentMode: .fit)
                    .overlay(
                        RoundedRectangle(cornerRadius: 30)
                        .stroke(outlineColor, lineWidth: 15)
                    )
                
                
                    VStack(alignment: .leading) {
                        
                        
                            Text("NOW AVAILABLE")
                            .foregroundColor(.white)
                                .bold()
                                .padding(.horizontal, 20)
                                .padding(.vertical, 5)
                                .background(outlineColor)
                                .cornerRadius(30)
                            
                                
                        
                        
                        Spacer()
                        
                        
                        ZStack {
                          ContainerRelativeShape()
                                .fill(LinearGradient(gradient: Gradient(colors: [.clear, outlineColor]), startPoint: .top, endPoint: .bottom))
                                .frame(maxWidth: .infinity, maxHeight: 400)
                                .shadow(radius: 5)
                            
                            //
                
                            VStack {
                                
                                VStack(alignment: .leading) {
                                    Text("NOW STREAMING").font(.system(size: 15)).opacity(0.9)
                                    Text("Check Back Into Hotel Transylvania").font(.system(size: 25)).bold()
                                    Text("The vivacious vampire Drac returns in this new cape-r.").font(.system(size: 15)).opacity(0.9)
                                }.foregroundColor(.white)
                                
                                Divider()
                                    .background(.white)
                                    .padding(.horizontal)
                                
                            HStack {
                                Image("AppDemo").resizable().frame(width: 45, height: 45)
                                
                                VStack(alignment: .leading) {
                                    Text(name).font(.system(size: 18)).bold()
                                    Text(message).font(.system(size: 15)).opacity(0.9)
                                    
                                }.foregroundColor(.white)
                                 
                                
                                VStack {
                                    Button {
                                        print("Button pressed")
                                    } label: {
                                        Text("GET").bold()
                                            .padding(.horizontal, 20)
                                            .padding(.vertical, 5)
                                            .background(Color.white)
                                            .cornerRadius(40)
                                            
                                    }
                                    
                                    Text("In-App purchases").font(.system(size: 10))
                                        .foregroundColor(.white).opacity(0.9)
                                }
                            }
                                
                            }.padding().padding(.top, 170)
                          
                        }
                    }
            }
        }.cornerRadius(30).padding().shadow(radius: 5)
    }
}



struct TodayPageModel_Previews: PreviewProvider {
    static var previews: some View {
        TodayPageModel()
    }
}

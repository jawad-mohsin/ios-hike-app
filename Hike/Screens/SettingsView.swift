import SwiftUI

struct SettingsView: View {
    var body: some View {
        // MARK: - PROPERTIES
        
        let alternateAppIcons: [String] = [
            "AppIcon-Backpack",
            "AppIcon-Campfire",
            "AppIcon-MagnifyingGlass",
            "AppIcon-Mushroom",
            "AppIcon-Camera",
            "AppIcon-Map",
        ]
        
        
        let rowData: [(rowLabel: String, rowContent: String?, rowIcon: String, rowTintColor: Color, rowLinkLabel: String?, rowLinkDestination: String?)] = [
                    ("Application", "Hike", "apps.iphone", .blue, nil, nil),
                    ("Compatibility", "iOS, iPadOS", "info.circle", .red, nil, nil),
                    ("Technology", "Swift", "swift", .orange, nil, nil),
                    ("Version", "1.0", "gear", .purple, nil, nil),
                    ("Developer", "JD", "ellipsis.curlybraces", .mint, nil, nil),
                    ("Designer", "Mobin", "paintpalette", .pink, nil, nil),
                    ("Website", nil, "globe", .indigo, "My Website", "https://jawadmohsin.netlify.app/")
                ]
        
        List {
            
            // MARK: - SECTION: HEADER
            Section {
                HStack {
                    Spacer()
                    Image(systemName:("laurel.leading"))
                        .font(.system(size: 80, weight: .black))
                    
                    VStack(spacing: -10) {
                        Text("Hike")
                            .font(.system(size: 66, weight: .black))
                        
                        Text("Editors Choice")
                            .fontWeight(.medium )
                    }
                    
                    Image(systemName:("laurel.trailing"))
                        .font(.system(size: 80, weight: .black))
                    
                    Spacer()
                }
                .foregroundStyle(
                    LinearGradient(colors: [.customGreenLight, .customGreenMedium, .customGreenDark], startPoint: .top, endPoint: .bottom)
                )
                .padding(.top, 8)
                VStack(spacing: 10) {
                    Text("Where can you find\nperfect tracks?")
                        .font(.title2)
                        .fontWeight(.heavy)
                    
                    Text("The hike which looks gorgeous in photos but is even better once you are actually there. The hike that hope to do again someday. \nFind the best day hikes in the app.")
                        .font(.footnote)
                        .italic()
                    
                    Text("Dust off the boots! it's time for wa walk.")
                        .fontWeight(.heavy)
                        .foregroundColor(.customGreenMedium)
                }
                .multilineTextAlignment(.center)
                .padding(.bottom, 16)
                .frame(maxWidth: .infinity)
            } // HEADER
            .listRowSeparator(.hidden)
            
            // MARK: - SECTION: ICONS
            Section(
                header: Text("Alternate Icons")
            ) {
                ScrollView(.horizontal, showsIndicators: false){
                    HStack(spacing: 12) {
                        ForEach(alternateAppIcons.indices, id: \.self) { item in
                            Button{
                                
                                
                                UIApplication.shared.setAlternateIconName(alternateAppIcons[item]){ error in
                                    if error != nil {
                                        print("Error Occured while changing the icon : \(String(describing: error?.localizedDescription))")
                                    }
                                    else {
                                        print("App Icon Updated Successfully!")
                                    }
                                    
                                }
   
                            } label: {
                                Image("\(alternateAppIcons[item])-Preview")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80, height: 80)
                                    .cornerRadius(16)
                            }
                        .buttonStyle(.borderless)
                        }
                    }
                    .padding(.top, 10)
                } // : SCROLL VIEW
                
                Text("Choose your favourite app icon from the collection above.")
                    .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.secondary)
                    .font(.footnote)
                    .padding(.bottom, 10)

            }
            .listRowSeparator(.hidden)
            
            
            
            
            // MARK: - SECTION: ABOUT
            
            Section(
                header: Text("About the app"),
                footer: HStack {
                    Spacer()
                    Text("Copyright © All right reserved.")
                    Spacer()
                }
                    .padding(.vertical, 8)
            ) {
                ForEach(rowData, id: \.rowLabel) { row in
                    if let rowContent = row.rowContent {
                        CustomListRowView(
                            rowLabel: row.rowLabel,
                            rowContent: rowContent,
                            rowIcon: row.rowIcon,
                            rowTintColor: row.rowTintColor
                        )
                    } else if let rowLinkLabel = row.rowLinkLabel, let rowLinkDestination = row.rowLinkDestination {
                        CustomListRowView(
                            rowLabel: row.rowLabel,
                            rowIcon: row.rowIcon,
                            rowTintColor: row.rowTintColor,
                            rowLinkLabel: rowLinkLabel,
                            rowLinkDestination: rowLinkDestination
                        )
                    }
                }
            } // : SECTION ABOUT
        } // : LIST
    }
}

#Preview {
    SettingsView()
}

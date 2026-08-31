
//
//  ContentView.swift
//  UltimateSocail
//
//  Created by Rüzgar cem Türkmen on 30.08.2026.
//

import SwiftUI

struct ContentView: View {
    @State private var searchText = ""
    @State private var selectedTab = 0
    @State private var selectedMainTab = 0
    @State private var favoriteItems = Set<UUID>()
    @State private var notificationCount = 3
    
    let categories = ["All", "Food", "Sports", "Music", "Art", "Technology"]
    
    let featuredItems = [
        Item(title: "City Tour", image: "city", rating: 4.8, price: "$250", date: "May 15", participants: 42),
        Item(title: "Dinner Event", image: "dinner", rating: 4.5, price: "$35", date: "May 18", participants: 16),
        Item(title: "Concert Ticket", image: "concert", rating: 4.7, price: "$60", date: "May 20", participants: 120),
        Item(title: "Tech Expo", image: "tech", rating: 4.6, price: "$15", date: "June 2", participants: 85)
    ]
    
    let popularItems = [
        Item(title: "Weekly Yoga", image: "yoga", rating: 4.9, price: "$30", date: "Every Tuesday", participants: 12),
        Item(title: "Museum Visit", image: "museum", rating: 4.4, price: "$10", date: "May 25", participants: 30),
        Item(title: "Bike Tour", image: "biking", rating: 4.7, price: "$20", date: "June 5", participants: 8),
        Item(title: "Coffee Workshop", image: "coffee", rating: 4.8, price: "$18", date: "May 22", participants: 15)
    ]
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("backgroundColor")
                    .ignoresSafeArea()
                
                VStack(spacing: 0) {
                    if selectedMainTab < 2 {
                        
                        VStack(spacing: 15) {
                            HStack {
                                Text(selectedTab == 0 ? "Home" : "Explore")
                                    .font(.system(size: 20, weight: .bold))
                                
                                Spacer()
                                
                                Button(action: {
                                    
                                }) {
                                    ZStack {
                                        Image(systemName: "bell.fill")
                                            .font(.system(size: 20))
                                            .foregroundColor(.gray)
                                            .padding(.horizontal, 8)
                                        
                                        if notificationCount > 0 {
                                            Text("\(notificationCount)")
                                                .font(.system(size: 12, weight: .bold))
                                                .foregroundColor(.white)
                                                .frame(width: 20, height: 20)
                                                .background(Color.red)
                                                .clipShape(Circle())
                                                .offset(x: 12, y: -10)
                                        }
                                    }
                                }
                                
                                Button(action: {
                                    withAnimation {
                                        selectedMainTab = 3
                                    }
                                }) {
                                    
                                    Image(systemName: "person.circle.fill")
                                        .font(.system(size: 25))
                                        .foregroundColor(.blue)
                                }
                            }
                            .padding(.horizontal)
                            
                            HStack {
                                HStack {
                                    Image(systemName: "magnifyingglass")
                                        .foregroundColor(.gray)
                                    
                                    TextField("Search events places, activities...", text: $searchText)
                                        .font(.system(size: 16))
                                }
                                .padding(10)
                                .background(Color(.systemGray6))
                                .cornerRadius(10)
                                
                                Button(action: {
                                    
                                }) {
                                    
                                    Image(systemName: "slider.horizontal.3")
                                        .foregroundColor(.blue)
                                        .padding(10)
                                        .background(Color(.systemGray6))
                                        .cornerRadius(10)
                                }
                            }
                            .padding(.horizontal)
                            .transition(.opacity)
                        }
                    }
                    
                    if selectedMainTab == 0 {
                        homeScreenContent
                    } else if selectedMainTab == 1 {
                        exploreScreenContent
                    } else if selectedMainTab == 2 {
                        favoriteScreenContent
                    } else {
                        profilScreenContent
                    }
                    
                    HStack(spacing: 0) {
                        tabBarButton(title: "Home", icon: "house.fill", tab: 0)
                        tabBarButton(title: "Explore", icon: "safari", tab: 1)
                        tabBarButton(title: "Favorites", icon: "heart", tab: 2)
                        tabBarButton(title: "Profile", icon: "person", tab: 3)
                    }
                    .padding(.vertical, 10)
                    .background(Color.white)
                    .shadow(color: Color.black.opacity(0.05), radius: 10, x: 0, y: -5)
                }
            }
            .navigationBarHidden(true)
        }
    }
    
    private func tabBarButton(title: String, icon: String, tab: Int) -> some View {
        Button(action: {
            withAnimation {
                selectedMainTab = tab
                
                if tab == 1 {
                    selectedTab = 0
                }
            }
        }) {
            
            VStack(spacing: 5) {
                ZStack {
                    Image(systemName: tab == selectedMainTab ? (icon == "heart" ? "heart.fill" : icon) : (icon == "house.fill" ? "house" : icon))
                        .font(.system(size: 22))
                        .foregroundColor(selectedMainTab == tab ? .blue : .gray)
                    
                    if icon == "heart" && !favoriteItems.isEmpty && tab != selectedMainTab {
                        Text("\(favoriteItems.count)")
                            .font(.system(size: 10, weight: .bold))
                            .foregroundColor(.white)
                            .frame(width: 16, height: 16)
                            .background(Color.red)
                            .clipShape(Circle())
                            .offset(x: 10, y: -8)
                    }
                }
                
                Text(title)
                    .font(.system(size: 12))
                    .foregroundColor(selectedMainTab == tab ? .blue : .gray)
            }
            .frame(maxWidth: .infinity)
            .contentShape(Rectangle())
        }
    }
    
    private var homeScreenContent: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing: 20) {
                
                VStack(alignment: .leading, spacing: 5) {
                    Text("Welcome Back")
                        .font(.system(size: 22, weight: .bold))
                    
                    Text("Today is \(formattedDate())")
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                }
                .padding(.horizontal)
                .padding(.top, 10)
                
                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        Text("Your Upcoming Events")
                            .font(.system(size: 20, weight: .bold))
                        
                        Spacer()
                        
                        Button("See All") {
                            
                        }
                        .font(.system(size: 14))
                        .foregroundColor(.blue)
                    }
                    .padding(.horizontal)
                    
                    HStack(spacing: 15) {
                        VStack {
                            Text("May")
                                .font(.system(size: 12, weight: .bold))
                                .foregroundColor(.white)
                                .padding(.top, 5)
                            
                            Text("15")
                                .font(.system(size: 22, weight: .heavy))
                                .foregroundColor(.white)
                                .padding(.bottom, 5)
                        }
                        .frame(width: 60)
                        .background(Color.blue)
                        .cornerRadius(10)
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Text("City Tour")
                                .font(.system(size: 18, weight: .bold))
                            
                            HStack {
                                Image(systemName: "clock")
                                    .foregroundColor(.gray)
                                
                                Text("10:00 AM - 2:00 PM")
                                    .font(.system(size: 14))
                                    .foregroundColor(.gray)
                            }
                            
                            HStack {
                                Image(systemName: "location")
                                    .foregroundColor(.gray)
                                
                                Text("Downtown")
                                    .font(.system(size: 14))
                                    .foregroundColor(.gray)
                            }
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            
                        }) {
                            
                            Image(systemName: "ellipsis")
                                .font(.system(size: 22))
                                .foregroundColor(.gray)
                                .rotationEffect(Angle(degrees: 90))
                                .frame(width: 40, height: 40)
                                .background(Color(.systemGray6))
                                .cornerRadius(8)
                        }
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(15)
                    .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 2)
                    .padding(.horizontal)
                }
                
                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        Text("Recommeded For You")
                            .font(.system(size: 20, weight: .bold))
                        
                        Spacer()
                        
                        Button("See All") {
                            withAnimation {
                                selectedMainTab = 1
                            }
                        }
                        .font(.system(size: 14))
                        .foregroundColor(.blue)
                    }
                    .padding(.horizontal)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 15) {
                            ForEach(featuredItems) { item in
                                FeaturedCard(
                                    item: item,
                                    isFavorite: favoriteItems.contains(item.id),
                                    toggleFavorite: {
                                        toggleFavorite(item)
                                    }
                                )
                            }
                        }
                        .padding(.horizontal)
                    }
                }
                .padding(.top, 5)
                
                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        Text("Recently Viewwed")
                            .font(.system(size: 20, weight: .bold))
                        
                        Spacer()
                    }
                    .padding(.horizontal)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 15) {
                            ForEach(featuredItems.prefix(3)) { item in
                                PopularCard(
                                    item: item,
                                    isFavorite: favoriteItems.contains(item.id),
                                    toggleFavorite: {
                                        toggleFavorite(item)
                                    }
                                )
                            }
                        }
                        .padding(.horizontal)
                    }
                }
                .padding(.top, 5)
                .padding(.bottom, 20)
            }
            .padding(.top, 10)
        }
    }
    
    
    private var exploreScreenContent: some View {
        VStack(spacing: 0) {
            ScrollView(.horizontal, showsIndicators: false) {
                
                HStack(spacing: 15) {
                    ForEach(0..<categories.count, id: \.self) { index in
                        
                        Button(action: {
                            withAnimation {
                                selectedTab = index
                            }
                        }) {
                            
                            Text(categories[index])
                                .padding(.vertical, 8)
                                .padding(.horizontal, 15)
                                .background(selectedTab == index ? Color.blue : Color.clear)
                                .foregroundColor(selectedTab == index ? .white : .gray)
                                .cornerRadius(20)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(Color.gray.opacity(0.3), lineWidth: selectedTab == index ? 0 : 1)
                                )
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                .padding(.horizontal)
                .padding(.top, 15)
            }
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading, spacing: 20) {
                    Text("Showing \(categories[selectedTab]) Events")
                        .font(.system(size: 16))
                        .foregroundColor(.gray)
                        .padding(.horizontal)
                        .padding(.top, 10)
                    
                    VStack(alignment: .leading, spacing: 10) {
                        HStack {
                            Text("Featured Events")
                                .font(.system(size: 20, weight: .bold))
                            
                            Spacer()
                            
                            Button("See All") {
                                
                            }
                            .font(.system(size: 14))
                            .foregroundColor(.blue)
                        }
                        .padding(.horizontal)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 15) {
                                ForEach(featuredItems) { item in
                                    FeaturedCard(
                                        item: item,
                                        isFavorite: favoriteItems.contains(item.id),
                                        toggleFavorite: {
                                            toggleFavorite(item)
                                        }
                                    )
                                }
                            }
                            .padding(.horizontal)
                        }
                    }
                    .padding(.top, 5)
                    
                    VStack(alignment: .leading, spacing: 10) {
                        HStack {
                            Text("Popular Events")
                                .font(.system(size: 20, weight: .bold))
                            
                            Spacer()
                            
                            Button("See All") {
                                
                            }
                            .font(.system(size: 14))
                            .foregroundColor(.blue)
                        }
                        .padding(.horizontal)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 15) {
                                ForEach(featuredItems) { item in
                                    PopularCard(
                                        item: item,
                                        isFavorite: favoriteItems.contains(item.id),
                                        toggleFavorite: {
                                            toggleFavorite(item)
                                        }
                                    )
                                }
                            }
                            .padding(.horizontal)
                        }
                    }
                    .padding(.top, 5)
                    
                    VStack(alignment: .leading, spacing: 10) {
                        HStack {
                            Text("Hear Events")
                                .font(.system(size: 20, weight: .bold))
                            
                            Spacer()
                            
                            Button("See Map") {
                                
                            }
                            .font(.system(size: 14))
                            .foregroundColor(.blue)
                        }
                        .padding(.horizontal)
                        
                        RoundedRectangle(cornerRadius: 15)
                            .fill(Color.blue.opacity(0.1))
                            .frame(height: 100)
                            .overlay(
                                VStack {
                                    Image(systemName: "map")
                                        .font(.system(size: 40))
                                        .foregroundColor(.blue)
                                    
                                    Text("Map View")
                                        .foregroundColor(.blue)
                                        .padding(.top, 5)
                                }
                            )
                            .padding(.horizontal)
                    }
                    .padding(.top, 5)
                    .padding(.bottom, 10)
                }
                .padding(.top, 5)
            }
        }
    }
    
    
    private var favoriteScreenContent: some View {
        VStack {
            HStack {
                Text("Your Favorites")
                    .font(.system(size: 20, weight: .bold))
                
                Spacer()
                
                Button(action: {
                    
                }) {
                    
                    Text("Edit")
                        .font(.system(size: 16))
                        .foregroundColor(.blue)
                }
            }
            .padding(.horizontal)
            .padding(.top, 15)
            
            if favoriteItems.isEmpty {
                
                Spacer()
                
                VStack(spacing: 15) {
                    Image(systemName: "heart")
                        .font(.system(size: 60))
                        .foregroundColor(.gray.opacity(0.5))
                    
                    Text("No Favorites yet")
                        .font(.system(size: 20, weight: .medium))
                    
                    Text("Events you like will appear here")
                        .font(.system(size: 16))
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                    
                    Button(action: {
                        withAnimation {
                            selectedMainTab = 1
                        }
                    }) {
                        
                        Text("Explore Events")
                            .font(.system(size: 16, weight: .medium))
                            .foregroundColor(.white)
                            .padding(.horizontal, 30)
                            .padding(.vertical, 12)
                            .background(Color.blue)
                            .cornerRadius(12)
                    }
                    .padding(.top, 10)
                }
                .padding(.horizontal, 40)
                
                Spacer()
            } else {
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 15) {
                        let favoriteFeaturedItems = featuredItems.filter { favoriteItems.contains($0.id) }
                        
                        if !favoriteFeaturedItems.isEmpty {
                            Text("Featured Events")
                                .font(.system(size: 18, weight: .bold))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.horizontal)
                                .padding(.top, 10)
                            
                            ForEach(favoriteFeaturedItems) { item in
                                HStack(spacing: 15) {
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(Color.blue.opacity(0.2))
                                        .overlay(
                                            Image(item.image)
                                                .resizable()
                                        )
                                        .frame(width: 80, height: 80)
                                    
                                    VStack(alignment: .leading, spacing: 5) {
                                        Text(item.title)
                                            .font(.system(size: 16, weight: .bold))
                                        
                                        Text(item.date)
                                            .font(.system(size: 14))
                                            .foregroundColor(.gray)
                                        
                                        HStack {
                                            Image(systemName: "star.fill")
                                                .foregroundColor(.yellow)
                                                .font(.system(size: 12))
                                            
                                            Text(String(format: "%.1f", item.rating))
                                                .font(.system(size: 12))
                                                .foregroundColor(.gray)
                                            
                                            Text("•")
                                                .foregroundColor(.gray)
                                            
                                            Text(item.price)
                                                .font(.system(size: 12, weight: .bold))
                                                .foregroundColor(.blue)
                                        }
                                    }
                                    
                                    Spacer()
                                    
                                    Button(action: {
                                        withAnimation {
                                            toggleFavorite(item)
                                         }
                                    }) {
                                        
                                        Image(systemName: "heart.fill")
                                            .foregroundColor(.red)
                                            .padding(8)
                                            .background(Color(.systemGray6))
                                            .cornerRadius(8)
                                    }
                                }
                                .padding(12)
                                .background(Color.white)
                                .cornerRadius(15)
                                .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 2)
                            }
                        }
                        
                        let favoritePopularItems = popularItems.filter { favoriteItems.contains($0.id) }
                        
                        if !favoritePopularItems.isEmpty {
                            Text("Popular Events")
                                .font(.system(size: 18, weight: .bold))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.horizontal)
                                .padding(.top, 10)
                            
                            ForEach(favoritePopularItems) { item in
                                HStack(spacing: 15) {
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(Color.blue.opacity(0.2))
                                        .overlay(
                                            Image(item.image)
                                                .resizable()
                                        )
                                        .frame(width: 80, height: 80)
                                    
                                    VStack(alignment: .leading, spacing: 5) {
                                        Text(item.title)
                                            .font(.system(size: 16, weight: .bold))
                                        
                                        Text(item.date)
                                            .font(.system(size: 14))
                                            .foregroundColor(.gray)
                                        
                                        HStack {
                                            Image(systemName: "star.fill")
                                                .foregroundColor(.yellow)
                                                .font(.system(size: 12))
                                            
                                            Text(String(format: "%.1f", item.rating))
                                                .font(.system(size: 12))
                                                .foregroundColor(.gray)
                                            
                                            Text("•")
                                                .foregroundColor(.gray)
                                            
                                            Text(item.price)
                                                .font(.system(size: 12, weight: .bold))
                                                .foregroundColor(.blue)
                                        }
                                    }
                                    
                                    Spacer()
                                    
                                    Button(action: {
                                        withAnimation {
                                            toggleFavorite(item)
                                        }
                                    }) {
                                        
                                        Image(systemName: "heart.fill")
                                            .foregroundColor(.red)
                                            .padding(8)
                                            .background(Color(.systemGray6))
                                            .cornerRadius(8)
                                    }
                                }
                                .padding(12)
                                .background(Color.white)
                                .cornerRadius(15)
                                .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 2)
                            }
                        }
                    }
                    .padding(.bottom, 20)
                }
            }
        }
    }
    
    private var profilScreenContent: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 20) {
                
                VStack(spacing: 15) {
                    Text("Profile")
                        .font(.system(size: 28, weight: .bold))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                    
                    VStack(spacing: 20) {
                        VStack(spacing: 10) {
                            Circle()
                                .fill(Color.blue.opacity(0.2))
                                .frame(width: 100, height: 100)
                                .overlay(
                                    Image(systemName: "person.fill")
                                        .font(.system(size: 40))
                                        .foregroundColor(.blue)
                                )
                            
                            Text("John Doe")
                                .font(.system(size: 22, weight: .black))
                            
                            HStack {
                                Image(systemName: "location.fill")
                                    .font(.system(size: 14))
                                    .foregroundColor(.gray)
                            }
                        }
                        
                        HStack(spacing: 30) {
                            VStack {
                                Text("12")
                                    .font(.system(size: 22, weight: .black))
                                
                                Text("Events")
                                    .font(.system(size: 14))
                                    .foregroundColor(.gray)
                            }
                            
                            Rectangle()
                                .fill(Color.gray.opacity(0.3))
                                .frame(width: 1, height: 40)
                            
                            VStack {
                                Text("8")
                                    .font(.system(size: 22, weight: .black))
                                
                                Text("Reviews")
                                    .font(.system(size: 14))
                                    .foregroundColor(.gray)
                            }
                            
                            Rectangle()
                                .fill(Color.gray.opacity(0.3))
                                .frame(width: 1, height: 40)
                            
                            VStack {
                                Text("\(favoriteItems.count)")
                                    .font(.system(size: 22, weight: .bold))
                                
                                Text("Favorites")
                                    .font(.system(size: 14))
                                    .foregroundColor(.gray)
                            }
                        }
                        
                        Button(action: {
                            
                        }) {
                            
                            Text("Edit Profile")
                                .font(.system(size: 16, weight: .bold))
                                .foregroundColor(.white)
                                .frame(height: 44)
                                .frame(maxWidth: .infinity)
                                .background(Color.blue)
                                .cornerRadius(22)
                        }
                        .padding(.horizontal, 30)
                        .padding(.top, 10)
                    }
                    .padding(.vertical, 20)
                    .background(Color.white)
                    .cornerRadius(15)
                    .shadow(color: Color.black.opacity(0.05), radius: 8, x: 0, y: 2)
                    .padding(.horizontal)
                }
                
                VStack(alignment: .leading, spacing: 5) {
                    Text("Settings")
                        .font(.system(size: 18, weight: .bold))
                        .padding(.horizontal)
                    
                    VStack(spacing: 0) {
                        settingRow(icon: "bell.fill", title: "notifications", hasToggle: true)
                        
                        Divider()
                            .padding(.leading, 50)
                        
                        settingRow(icon: "creditcard.fill", title: "Payment Methods")
                        
                        Divider()
                            .padding(.leading, 50)
                        
                        settingRow(icon: "globe", title: "Language", value: "English")
                        
                        Divider()
                            .padding(.leading, 50)
                        
                        settingRow(icon: "questionmark.circle.fill", title: "Help & Support")
                        
                        Divider()
                            .padding(.leading, 50)
                        
                        settingRow(icon: "info.circle.fill", title: "About")
                    }
                    .background(Color.white)
                    .cornerRadius(15)
                    .shadow(color: Color.black.opacity(0.05), radius: 8, x: 0, y: 2)
                }
                
                Button(action: {
                    
                }) {
                    
                    HStack {
                        Image(systemName: "arrow.right.fill")
                            .font(.system(size: 18))
                        
                        Text("Logout")
                            .font(.system(size: 16, weight: .medium))
                    }
                    .foregroundColor(.red)
                    .frame(height: 50)
                    .frame(maxWidth: .infinity)
                    .background(Color.white)
                    .cornerRadius(15)
                    .shadow(color: Color.black.opacity(0.05), radius: 8, x: 0, y: 2)
                }
                .padding(.horizontal)
                .padding(.top, 10)
                .padding(.bottom, 20)
            }
            .padding(.top, 10)
        }
    }
    
    private func settingRow(icon: String, title: String, value: String? = nil, hasToggle: Bool = false) -> some View {
        HStack {
            Image(systemName: icon)
                .font(.system(size: 18))
                .foregroundColor(.blue)
                .frame(width: 30, height: 30)
                .padding(.leading, 10)
            
            Text(title)
                .font(.system(size: 16))
            
            Spacer()
            
            if let value = value {
                Text(value)
                    .font(.system(size: 16))
                    .foregroundColor(.gray)
            }
            
            if hasToggle {
                Toggle("", isOn: .constant(true))
                    .labelsHidden()
            }
            
            if !hasToggle && value == nil {
                Image(systemName: "chevron.fill")
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
            }
        }
        .padding(.vertical, 12)
        .padding(.horizontal, 10)
        .contentShape(Rectangle())
    }
    
    private func formattedDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, MMMM d, yyyy"
        return formatter.string(from: Date())
    }
    
    private func toggleFavorite(_ item: Item) {
        withAnimation {
            if favoriteItems.contains(item.id) {
                favoriteItems.remove(item.id)
            } else {
                favoriteItems.insert(item.id)
            }
        }
    }
}


struct FeaturedCard: View {
    let item: Item
    let isFavorite: Bool
    let toggleFavorite: () -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            ZStack(alignment: .topLeading) {
                RoundedRectangle(cornerRadius: 15)
                    .fill(Color.blue.opacity(0.2))
                    .overlay(
                        Image(item.image)
                            .resizable()
                    )
                    .frame(width: 250, height: 150)
                    .cornerRadius(15)
                
                Button(action: toggleFavorite) {
                    Image(systemName: isFavorite ? "heart.fill" : "heart")
                        .font(.system(size: 20))
                        .foregroundColor(isFavorite ? .red : .white)
                        .padding(8)
                        .background(
                            Circle()
                                .fill(Color.white.opacity(0.8))
                        )
                        .shadow(color: Color.black.opacity(0.2), radius: 2, x: 0, y: 1)
                }
                .padding(10)
            }
            
            Text(item.date)
                .font(.system(size: 14))
                .foregroundColor(.gray)
            
            Text(item.title)
                .font(.system(size: 16, weight: .bold))
            
            HStack {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
                    .font(.system(size: 12))
                
                Text(String(format: "%.1f", item.rating))
                    .font(.system(size: 10))
                    .foregroundColor(.gray)
                
                Text("\(item.participants)")
                    .font(.system(size: 12))
                    .foregroundColor(.gray)
            }
            .padding(.leading, 8)
            
            Spacer()
            
            Text(item.price)
                .font(.system(size: 14, weight: .bold))
                .foregroundColor(.blue)
        }
        .frame(width: 250)
        .padding(10)
        .background(Color.white)
        .cornerRadius(15)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 1)
    }
}


struct PopularCard: View {
    let item: Item
    let isFavorite: Bool
    let toggleFavorite: () -> Void
    
    var body: some View {
        HStack(spacing: 15) {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.blue.opacity(0.2))
                .overlay(
                    Image(item.image)
                        .resizable()
                )
                .frame(width: 70, height: 70)
                .cornerRadius(10)
            
            VStack(alignment: .leading, spacing: 5) {
                Text(item.date)
                    .font(.system(size: 12))
                    .foregroundColor(.gray)
                
                Text(item.title)
                    .font(.system(size: 16, weight: .bold))
                
                HStack {
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                        .font(.system(size: 12))
                    
                    Text(String(format: "%.1f", item.rating))
                        .font(.system(size: 12))
                        .foregroundColor(.gray)
                    
                    HStack(spacing: 2) {
                        Image(systemName: "person.fill")
                            .font(.system(size: 10))
                            .foregroundColor(.gray)
                        
                        Text("\(item.participants)")
                            .font(.system(size: 12))
                            .foregroundColor(.gray)
                    }
                    .padding(.leading, 5)
                }
                
                Text(item.price)
                    .font(.system(size: 14, weight: .bold))
                    .foregroundColor(.blue)
            }
            
            Spacer()
            
            Button(action: toggleFavorite) {
                Image(systemName: isFavorite ? "heart.fill" : "heart")
                    .foregroundColor(isFavorite ? .red : .gray)
                    .padding(8)
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
            }
        }
        .padding(10)
        .frame(width: 300, height: 90)
        .background(Color.white)
        .cornerRadius(15)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
    }
}
    

struct Item: Identifiable {
    let id = UUID()
    let title: String
    let image: String
    let rating: Double
    let price: String
    let date: String
    let participants: Int
}

#Preview(body: {
    ContentView()
})

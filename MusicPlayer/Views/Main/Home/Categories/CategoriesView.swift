//
//  Categoriesview.swift
//  MusicPlayer
//
//  Created by Валентина Евдокимова on 01.05.2023.
//

import SwiftUI

struct CategoriesView: View {
    private var addaptiveColumns = [
        GridItem(.adaptive(minimum: 150, maximum: 170))
    ]
    
    @StateObject private var viewModel = CategoriesViewModel()
    var body: some View {
        NavigationStack {
            LazyVGrid(columns: addaptiveColumns, spacing: 25) {
                Section(header: Text("Browse categories")
                    .font(.avenir(.heavy, size: 25))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 25)
                ) {
                    ForEach(viewModel.categories, id: \.self) { category in
                        NavigationLink {
                            CategoryView(viewModel: CategoryViewModel(nameCategory: category.name))
                        } label: {
                            ZStack {
                                Rectangle()
                                    .fill(
                                        LinearGradient(
                                            colors: [.random, .black],
                                            startPoint: .top,
                                            endPoint: .bottom)
                                    )
                                    .frame(width: 150, height: 150)
                                    .cornerRadius(30)
                                Text(category.name.localizedCapitalized)
                                    .font(.avenir(.medium, size: 20))
                                    .frame(width: 120)
                                    .multilineTextAlignment(.center)
                                    .lineLimit(3)
                                    .foregroundColor(.white)
                            }
                           
                        }
                        
                        
                    }
                }
            }
            .ignoresSafeArea()
            .task {
                await viewModel.loadCategories()
            }
            .overlay(
                viewModel.isLoading ? LoadingView(isShowing: $viewModel.isLoading) : nil
            )
        }
    }
    
}

struct CategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesView()
            .frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight)
            .background(Color.black.ignoresSafeArea())
    }
}

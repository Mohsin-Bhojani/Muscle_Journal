//  HomeView.swift
//  Muscle_Journal
//
//  Created by Abbas on 22/05/2025.


import SwiftUI

struct HomeView: View{
    @StateObject private var viewModel = WorkoutViewModel()
    @State private var highlightedstat: StatType? = nil
    @State private var showNotifications = false 
}

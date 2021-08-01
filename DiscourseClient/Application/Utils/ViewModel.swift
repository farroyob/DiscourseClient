//
//  ViewModel.swift
//  DiscourseClient
//
//  Created by Freddy A. on 7/24/21.
//

import Foundation

protocol ViewModel {
    associatedtype View // La vista sera un protocolo
    associatedtype Coordinator // Seera el propio coodinator
    associatedtype UseCases
    
    var view: View? { get }
    var coordinator: Coordinator? { get }
    var useCases: UseCases { get }
}

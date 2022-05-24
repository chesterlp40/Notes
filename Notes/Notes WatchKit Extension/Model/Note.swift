//
//  Note.swift
//  Notes WatchKit Extension
//
//  Created by Ezequiel Rasgido on 24/05/2022.
//

import Foundation

//MARK: - Note Section

internal struct Note: Identifiable, Codable {
    internal let id: UUID
    internal let text: String
}

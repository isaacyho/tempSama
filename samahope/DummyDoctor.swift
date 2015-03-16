//
//  DummyDoctor.swift
//  samahope
//
//  Created by Isaac Ho on 3/14/15.
//  Copyright (c) 2015 Codepath. All rights reserved.
//

import Foundation

class Doctor {
    var name: String?
    var location: String?
    var treatment: Treatment?
    var profilePicUrl: String?
    var amountFunded: Int?
    var amountNeeded: Int?

    init() {
        name = "Dr. Heebie Jeebies"
        location = "Baton Rouge"
        treatment = Treatment()
        treatment!.name = "Gout"
        amountFunded = 823
        amountNeeded = 1500
    }
}
//
//  Location.swift
//  Bru
//
//  Created by Prudhvi Gadiraju on 3/3/19.
//  Copyright © 2019 Prudhvi Gadiraju. All rights reserved.
//

import Foundation

struct BrewDBJson: Codable {
    let currentPage, numberOfPages, totalResults: Int
    let data: [Breweries]
    let status: String
}

struct Breweries: Codable {
    let id, name, streetAddress, locality: String
    let region, postalCode, phone: String
    let website: String
    let latitude, longitude: Double
    let isPrimary, inPlanning, isClosed, openToPublic: String
    let locationType, locationTypeDisplay, countryISOCode, status: String
    let statusDisplay, createDate, updateDate, breweryID: String
    let brewery: Brewery
    let country: Country
    let hoursOfOperation, yearOpened, hoursOfOperationNotes, timezoneID: String?
    
    enum CodingKeys: String, CodingKey {
        case id, name, streetAddress, locality, region, postalCode, phone, website, latitude, longitude, isPrimary, inPlanning, isClosed, openToPublic, locationType, locationTypeDisplay
        case countryISOCode = "countryIsoCode"
        case status, statusDisplay, createDate, updateDate
        case breweryID = "breweryId"
        case brewery, country, hoursOfOperation, yearOpened, hoursOfOperationNotes
        case timezoneID = "timezoneId"
    }
}

struct Brewery: Codable {
    let id, name, nameShortDisplay, description: String
    let website: String
    let established, isOrganic: String
    let images: Images
    let status, statusDisplay, createDate, updateDate: String
    let isMassOwned, isInBusiness, isVerified: String
}

struct Images: Codable {
    let icon, medium, large, squareMedium: String
    let squareLarge: String
}

struct Country: Codable {
    let isoCode, name, displayName, isoThree: String
    let numberCode: Int
    let createDate: String
}

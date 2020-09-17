//
//  UsedCarsList.swift
//  CarFax
//
//  Created by Harsh_Dev on 2020-09-17.
//  Copyright © 2020 Pineapple Inc. All rights reserved.
//

import Foundation
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let usedCarListResponse = try? newJSONDecoder().decode(UsedCarListResponse.self, from: jsonData)



// MARK: - UsedCarListResponse
struct UsedCarListResponse: Codable {
    var backfillCount: Int?
    var breadCrumbs: [BreadCrumb]?
    var dealerNewCount, dealerUsedCount, enhancedCount: Int?
    var facetCountMap: [String: FacetCountMap]?
    var listings: [Listing]?
    var page, pageSize: Int?
    var relatedLinks: RelatedLinks?
    var searchArea: SearchArea?
    var searchRequest: SearchRequest?
    var seoURL: String?
    var totalListingCount, totalPageCount: Int?

    enum CodingKeys: String, CodingKey {
        case backfillCount, breadCrumbs, dealerNewCount, dealerUsedCount, enhancedCount, facetCountMap, listings, page, pageSize, relatedLinks, searchArea, searchRequest
        case seoURL = "seoUrl"
        case totalListingCount, totalPageCount
    }
}

// MARK: - BreadCrumb
struct BreadCrumb: Codable {
    var label: String?
    var link: String?
    var position: Int?
}

// MARK: - FacetCountMap
struct FacetCountMap: Codable {
    var facets: [Facet]?
}

// MARK: - Facet
struct Facet: Codable {
    var encodedName, name: String?
    var value: Int?
    var facetDescription: String?

    enum CodingKeys: String, CodingKey {
        case encodedName, name, value
        case facetDescription = "description"
    }
}

// MARK: - Listing
struct Listing: Codable {
    var accidentHistory: History?
    var advantage, backfill: Bool?
    var badge: Badge?
    var bedLength: BedLength?
    var bodytype: Bodytype?
    var cabType: BedLength?
    var certified: Bool?
    var currentPrice: Int?
    var dealer: Dealer?
    var dealerType: DealerType?
    var displacement: String?
    var distanceToDealer: Double?
    var drivetype: Drivetype?
    var engine: Engine?
    var exteriorColor, firstSeen: String?
    var followCount: Int?
    var following: Bool?
    var fuel: Fuel?
    var hasViewed: Bool?
    var id: String?
    var imageCount: Int?
    var images: Images?
    var interiorColor: String?
    var isEnriched: Bool?
    var listPrice: Double?
    var make: String?
    var mileage: Int?
    var model: String?
    var monthlyPaymentEstimate: MonthlyPaymentEstimate?
    var mpgCity, mpgHighway: Int?
    var newTopOptions: [String]?
    var noAccidents, oneOwner: Bool?
    var onePrice: Int?
    var onePriceArrows: [OnePriceArrow]?
    var onlineOnly: Bool?
    var ownerHistory: History?
    var personalUse: Bool?
    var recordType: RecordType?
    var sentLead: Bool?
    var serviceHistory: ServiceHistory?
    var serviceRecords: Bool?
    var sortScore: Double?
    var stockNumber: String?
    var subTrim: BedLength?
    var topOptions: [String]?
    var transmission: Transmission?
    var trim: String?
    var vdpURL: String?
    var vehicleCondition: VehicleCondition?
    var vehicleUseHistory: History?
    var vin: String?
    var year: Int?
    var listingStatus: String?

    enum CodingKeys: String, CodingKey {
        case accidentHistory, advantage, backfill, badge, bedLength, bodytype, cabType, certified, currentPrice, dealer, dealerType, displacement, distanceToDealer, drivetype, engine, exteriorColor, firstSeen, followCount, following, fuel, hasViewed, id, imageCount, images, interiorColor, isEnriched, listPrice, make, mileage, model, monthlyPaymentEstimate, mpgCity, mpgHighway, newTopOptions, noAccidents, oneOwner, onePrice, onePriceArrows, onlineOnly, ownerHistory, personalUse, recordType, sentLead, serviceHistory, serviceRecords, sortScore, stockNumber, subTrim, topOptions, transmission, trim
        case vdpURL = "vdpUrl"
        case vehicleCondition, vehicleUseHistory, vin, year, listingStatus
    }
}

// MARK: - History
struct History: Codable {
    var accidentSummary: [AccidentSummary]?
    var icon: AccidentHistoryIcon?
    var iconURL: String?
    var text: AccidentHistoryText?
    var history: [AccidentHistoryHistory]?

    enum CodingKeys: String, CodingKey {
        case accidentSummary, icon
        case iconURL = "iconUrl"
        case text, history
    }
}

enum AccidentSummary: String, Codable {
    case noAccidentDamageReportedToCARFAX = "No accident/damage reported to CARFAX"
}

// MARK: - AccidentHistoryHistory
struct AccidentHistoryHistory: Codable {
    var city, endOwnershipDate: String?
    var ownerNumber: Int?
    var purchaseDate, state: String?
    var averageMilesPerYear: Int?
    var useType: UseType?
}

enum UseType: String, Codable {
    case commercialUse = "Commercial Use"
    case personalLease = "Personal Lease"
    case personalUse = "Personal Use"
}

enum AccidentHistoryIcon: String, Codable {
    case commercial = "commercial"
    case noAccident = "noAccident"
    case owner1 = "owner1"
    case owner3 = "owner3"
    case personal = "personal"
}

enum AccidentHistoryText: String, Codable {
    case carfax1Owner = "CARFAX 1-Owner"
    case commercialUse = "Commercial Use"
    case noAccidentOrDamageReported = "No Accident or Damage Reported"
    case personalUse = "Personal Use"
    case the3Owners = "3+ Owners"
}

enum Badge: String, Codable {
    case good = "GOOD"
    case great = "GREAT"
}

enum BedLength: String, Codable {
    case entertainment = "Entertainment"
    case unspecified = "Unspecified"
}

enum Bodytype: String, Codable {
    case sedan = "Sedan"
    case suv = "SUV"
}

// MARK: - Dealer
struct Dealer: Codable {
    var address: String?
    var backfill: Bool?
    var carfaxID: String?
    var cfxMicrositeURL: String?
    var city: String?
    var dealerAverageRating: Double?
    var dealerInventoryURL: String?
    var dealerLeadType, dealerReviewComments: String?
    var dealerReviewCount: Int?
    var dealerReviewDate: String?
    var dealerReviewRating: Int?
    var dealerReviewReviewer, dealerReviewTitle, latitude, longitude: String?
    var name: String?
    var onlineOnly: Bool?
    var phone: String?
    var state: String?
    var zip: String?

    enum CodingKeys: String, CodingKey {
        case address, backfill
        case carfaxID = "carfaxId"
        case cfxMicrositeURL = "cfxMicrositeUrl"
        case city, dealerAverageRating
        case dealerInventoryURL = "dealerInventoryUrl"
        case dealerLeadType, dealerReviewComments, dealerReviewCount, dealerReviewDate, dealerReviewRating, dealerReviewReviewer, dealerReviewTitle, latitude, longitude, name, onlineOnly, phone, state, zip
    }
}

enum State: String, Codable {
    case ct = "CT"
    case md = "MD"
    case ny = "NY"
    case va = "VA"
}

enum DealerType: String, Codable {
    case new = "NEW"
    case used = "USED"
}

enum Drivetype: String, Codable {
    case awd = "AWD"
    case fwd = "FWD"
}

enum Engine: String, Codable {
    case the4Cyl = "4 Cyl"
    case the6Cyl = "6 Cyl"
}

enum Fuel: String, Codable {
    case gasoline = "Gasoline"
}

// MARK: - Images
struct Images: Codable {
    var baseURL: String?
    var firstPhoto: FirstPhoto?
    var large, medium, small: [String]?

    enum CodingKeys: String, CodingKey {
        case baseURL = "baseUrl"
        case firstPhoto, large, medium, small
    }
}

// MARK: - FirstPhoto
struct FirstPhoto: Codable {
    var large, medium, small: String?
}

enum Make: String, Codable {
    case acura = "Acura"
}

// MARK: - MonthlyPaymentEstimate
struct MonthlyPaymentEstimate: Codable {
    var downPaymentAmount: Double?
    var downPaymentPercent, interestRate: Int?
    var loanAmount, monthlyPayment: Double?
    var price, termInMonths: Int?
}

// MARK: - OnePriceArrow
struct OnePriceArrow: Codable {
    var arrow: Arrow?
    var arrowURL: String?
    var icon: OnePriceArrowIcon?
    var iconURL: String?
    var order: Int?
    var text: OnePriceArrowText?

    enum CodingKeys: String, CodingKey {
        case arrow
        case arrowURL = "arrowUrl"
        case icon
        case iconURL = "iconUrl"
        case order, text
    }
}

enum Arrow: String, Codable {
    case down = "DOWN"
    case up = "UP"
}

enum OnePriceArrowIcon: String, Codable {
    case cpo = "cpo"
    case noAccident = "noAccident"
    case owner1 = "owner1"
    case personal = "personal"
    case recall = "recall"
    case service = "service"
    case wellMaintained = "wellMaintained"
}

enum OnePriceArrowText: String, Codable {
    case certifiedPreOwned = "Certified Pre-Owned"
    case noAccidentsReported = "No Accidents Reported"
    case openRecall = "Open Recall"
    case personalVehicle = "Personal Vehicle"
    case priorCertifiedPreOwned = "Prior Certified Pre-Owned"
    case regularOilChanges = "Regular Oil Changes"
    case serviceHistory = "Service History"
    case the1OwnerVehicle = "1-Owner Vehicle"
}

enum RecordType: String, Codable {
    case enhanced = "ENHANCED"
}

// MARK: - ServiceHistory
struct ServiceHistory: Codable {
    var history: [ServiceHistoryHistory]?
    var icon: OnePriceArrowIcon?
    var iconURL: String?
    var number: Int?
    var text: OnePriceArrowText?

    enum CodingKeys: String, CodingKey {
        case history, icon
        case iconURL = "iconUrl"
        case number, text
    }
}

// MARK: - ServiceHistoryHistory
struct ServiceHistoryHistory: Codable {
    var city, date, historyDescription: String?
    var odometerReading: Int?
    var source: String?
    var state: State?

    enum CodingKeys: String, CodingKey {
        case city, date
        case historyDescription = "description"
        case odometerReading, source, state
    }
}

enum Transmission: String, Codable {
    case automatic = "Automatic"
}

enum Trim: String, Codable {
    case advance = "Advance"
    case base = "Base"
    case technology = "Technology"
    case unspecified = "Unspecified"
}

enum VehicleCondition: String, Codable {
    case used = "Used"
}

// MARK: - RelatedLinks
struct RelatedLinks: Codable {
    var acuraBodytypes, acuraModels: [Acura]?

    enum CodingKeys: String, CodingKey {
        case acuraBodytypes = "Acura Bodytypes"
        case acuraModels = "Acura Models"
    }
}

// MARK: - Acura
struct Acura: Codable {
    var count: Int?
    var text: String?
    var url: String?
}

// MARK: - SearchArea
struct SearchArea: Codable {
    var city: String?
    var dynamicRadii: [Int]?
    var dynamicRadius: Bool?
    var latitude, longitude: Double?
    var radius: Int?
    var state: State?
    var zip: String?
}

// MARK: - SearchRequest
struct SearchRequest: Codable {
    var make: Make?
    var mileageRange: Range?
    var priceRange: PriceRange?
    var radius: Int?
    var srpURL, webHost: String?
    var yearRange: Range?
    var zip: String?

    enum CodingKeys: String, CodingKey {
        case make, mileageRange, priceRange, radius
        case srpURL = "srpUrl"
        case webHost, yearRange, zip
    }
}

// MARK: - Range
struct Range: Codable {
    var max, min: Int?
}

// MARK: - PriceRange
struct PriceRange: Codable {
    var min: Int?
}

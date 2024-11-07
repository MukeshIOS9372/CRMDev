//
//  CommonVerticleListModel.swift
//  Main_CRM
//
//  Created by Mukesh Behera on 05/11/24.
//

import Foundation

struct CommonVerticleListModel: Identifiable, Decodable {
    var id: String
    var itemName: String = ""
    var title: String = ""
    var cartItemsCount: Int?
    var relatedTo: String = ""
    var address: String = ""
    var schedule: String = ""
    var client: ContactInfo?
    var horizontalMembers: [HorizontalMembersView]?
    var progress: Float?
    var status: String?
    var statusColor: String?
    var phases: Phases?
    var tasks: Tasks?
    var amount: String = ""
    var timeAgo: String = ""
    var profitabilityArr: [ProfitabilityItem]?
    var email: ContactInfo?
    var phone: ContactInfo?
    var category: Client?
    var badgeCount: Int = 0
    var isMessageShow: Bool = false
    var paymentID: String?
    var isPaymentSettled: Bool = false
    
}

struct Client: Decodable {
    var name: String
    var info: String
}

struct Phases: Decodable {
    var current: Int
    var total: Int
}

struct Tasks: Decodable {
    var completed: Int
    var total: Int
}

struct ContactInfo: Decodable {
    var imgName: String
    var title: String
}


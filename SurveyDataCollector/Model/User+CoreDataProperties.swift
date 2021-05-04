//
//  User+CoreDataProperties.swift
//  SurveyDataCollector
//
//  Created by Dominik Huffield on 5/4/21.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var username: String?
    @NSManaged public var password: String?
    @NSManaged public var email: String?
    @NSManaged public var response: Response?

}

extension User : Identifiable {

}

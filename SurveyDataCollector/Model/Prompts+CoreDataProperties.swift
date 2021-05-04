//
//  Prompts+CoreDataProperties.swift
//  SurveyDataCollector
//
//  Created by Dominik Huffield on 5/4/21.
//
//

import Foundation
import CoreData


extension Prompts {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Prompts> {
        return NSFetchRequest<Prompts>(entityName: "Prompts")
    }

    @NSManaged public var question1: String?
    @NSManaged public var question2: String?
    @NSManaged public var question3: String?
    @NSManaged public var question4: String?
    @NSManaged public var question5: String?
    @NSManaged public var response: NSSet?

}

// MARK: Generated accessors for response
extension Prompts {

    @objc(addResponseObject:)
    @NSManaged public func addToResponse(_ value: Response)

    @objc(removeResponseObject:)
    @NSManaged public func removeFromResponse(_ value: Response)

    @objc(addResponse:)
    @NSManaged public func addToResponse(_ values: NSSet)

    @objc(removeResponse:)
    @NSManaged public func removeFromResponse(_ values: NSSet)

}

extension Prompts : Identifiable {

}

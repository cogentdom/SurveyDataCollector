//
//  Response+CoreDataProperties.swift
//  SurveyDataCollector
//
//  Created by Dominik Huffield on 5/4/21.
//
//

import Foundation
import CoreData


extension Response {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Response> {
        return NSFetchRequest<Response>(entityName: "Response")
    }

    @NSManaged public var response1: Float
    @NSManaged public var response2: Float
    @NSManaged public var response3: Float
    @NSManaged public var response4: Float
    @NSManaged public var response5: Float
    @NSManaged public var user: NSSet?
    @NSManaged public var prompts: NSSet?

}

// MARK: Generated accessors for user
extension Response {

    @objc(addUserObject:)
    @NSManaged public func addToUser(_ value: User)

    @objc(removeUserObject:)
    @NSManaged public func removeFromUser(_ value: User)

    @objc(addUser:)
    @NSManaged public func addToUser(_ values: NSSet)

    @objc(removeUser:)
    @NSManaged public func removeFromUser(_ values: NSSet)

}

// MARK: Generated accessors for prompts
extension Response {

    @objc(addPromptsObject:)
    @NSManaged public func addToPrompts(_ value: Prompts)

    @objc(removePromptsObject:)
    @NSManaged public func removeFromPrompts(_ value: Prompts)

    @objc(addPrompts:)
    @NSManaged public func addToPrompts(_ values: NSSet)

    @objc(removePrompts:)
    @NSManaged public func removeFromPrompts(_ values: NSSet)

}

extension Response : Identifiable {

}

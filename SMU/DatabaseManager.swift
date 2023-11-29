//
//  DatabaseManager.swift
//  SMU
//
//  Created by Swati Bhandare on 10/21/23.
//

import Foundation
var shareInstance = DatabaseManager()

class DatabaseManager: NSObject{

    var database:FMDatabase? = nil
    
    class func getInstance() -> DatabaseManager{
        if shareInstance.database == nil{
            shareInstance.database = FMDatabase(path: Util.getPath("SMU.db"))
        }
        return shareInstance
    }
    
    func saveData(_ modelInfo:FamilyMemberModel) -> Bool{
        shareInstance.database?.open()
        
        shareInstance.database?.executeStatements("CREATE TABLE IF NOT EXISTS Familymember(id INTEGER,firstname TEXT, lastname TEXT, email TEXT, phone TEXT, doctorId TEXT , PRIMARY KEY(id AUTOINCREMENT))")
        print("table created")
        let isSave = shareInstance.database?.executeUpdate("INSERT INTO Familymember(firstname, lastname, email, phone, doctorId) VALUES (?, ?, ?, ?, ?)", withArgumentsIn: [modelInfo.fname, modelInfo.lname, modelInfo.email, modelInfo.phone, " "])
        shareInstance.database?.close()
        
        return isSave!
    }
    
    func getAllFamilyMembers() -> NSMutableArray {
        shareInstance.database!.open()
        
        let resultSet:FMResultSet! = shareInstance.database!.executeQuery("SELECT * from Familymember", withArgumentsIn: [0])
        
        let itemInfo:NSMutableArray = NSMutableArray()
        if(resultSet != nil){
            
            while resultSet.next(){
                let item:FamilyMemberModel = FamilyMemberModel(fname: String(resultSet.string(forColumn: "firstname")!), lname: String(resultSet.string(forColumn: "lastname")!), phone: String(resultSet.string(forColumn: "phone")!), email: String(resultSet.string(forColumn: "email")!),
                     doctorId:
                    String(resultSet.string(forColumn: "doctorId")!))
                itemInfo.add(item)
            }
        }
        shareInstance.database!.close()
        return itemInfo
    }
    
    //... Doctors
    
    func saveDoctorsInfo(_ doctor : String) -> Bool{
        shareInstance.database?.open()
        shareInstance.database!.executeUpdate("ALTER TABLE Familymember ADD doctorId varchar(255); ", withArgumentsIn: [0])
        
        let isSave = shareInstance.database?.executeUpdate("UPDATE Familymember SET doctorId = ? ", withArgumentsIn: [doctor])
        shareInstance.database?.close()
        
        print(doctor)
        return isSave!
    }
    
    //.. Events
    
    func addEvent(_ modelInfo:EventModel) -> Bool{
        shareInstance.database?.open()
        
        shareInstance.database!.executeUpdate("ALTER TABLE EVENT MODIFY dateTime DATETIME; ", withArgumentsIn: [0])
        
        shareInstance.database?.executeStatements("CREATE TABLE IF NOT EXISTS Event(eventId INTEGER,userId INTEGER, eventName TEXT, dateTime DATETIME,PRIMARY KEY(eventId AUTOINCREMENT))")
        
        print("table created")
        
        
        let isSave = shareInstance.database?.executeUpdate("INSERT INTO Event(eventName, userId, dateTime) VALUES (?, ?, ?)", withArgumentsIn: [modelInfo.eventName, "1", modelInfo.eventDateTime])
        shareInstance.database?.close()
        
        return isSave!
    }
    
    
    func getAllEvents() -> NSMutableArray {
        shareInstance.database!.open()
        
        let resultSet:FMResultSet! = shareInstance.database!.executeQuery("SELECT * from Event", withArgumentsIn: [0])
        
        let itemInfo:NSMutableArray = NSMutableArray()
        if(resultSet != nil){
            
            while resultSet.next(){
                let item:EventModel = EventModel(
                    eventId: Int(resultSet.int(forColumn: "eventId")),
                            userId: Int(resultSet.int(forColumn: "userId")), eventName: String(resultSet.string(forColumn: "eventName")!), eventDateTime: String(resultSet.string(forColumn: "dateTime")!))
                
                itemInfo.add(item)
            }
        }
        shareInstance.database!.close()
        return itemInfo
    }
}


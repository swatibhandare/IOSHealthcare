//
//  Util.swift
//  SMU
//
//  Created by Swati Bhandare on 10/21/23.
//

import Foundation

class Util: NSObject{
    
    class func getPath(_ fileName: String) -> String{
        let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let fileUrl = documentDirectory.appendingPathComponent(fileName)
        print("Database path= \(fileUrl.path)")
        return fileUrl.path
    }
    
    class func copyDatabase(_ filename: String){
        let dbPath = getPath("SMU.db")
        let fileManager = FileManager.default
        
        if !fileManager.fileExists(atPath: dbPath){
            let bunddle = Bundle.main.resourceURL
            let file = bunddle?.appendingPathComponent(filename)
            var error:NSError?
            do{
                try fileManager.copyItem(atPath: (file?.path)!, toPath: dbPath)
            }catch let error1 as NSError{
                error = error1
            }
            
            if error == nil {
                print("Error in db")
            }else{
                print("Yeah !!")
            }
        }
    }
}

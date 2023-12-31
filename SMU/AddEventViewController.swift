//
//  AddEventViewController.swift
//  SMU
//
//  Created by Swati Bhandare on 11/22/23.
//

import UIKit

class AddEventViewController: UIViewController {

    @IBOutlet weak var eventNameUIField: UITextField!
    
    
    @IBOutlet weak var dateTimeUIField: UIDatePicker!
    
    @IBOutlet weak var endDateTimeUIField: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func addEventClicked(_ sender: UIButton) {
    
        var dateTimeFormatter : RelativeDateTimeFormatter{
             let formatter = RelativeDateTimeFormatter()
            formatter.dateTimeStyle = .numeric
            return formatter
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy dddd HH  MM SS FFF" // 2023 0011 17  12 00 002
        let formattingDateString = dateFormatter.string(from: dateTimeUIField.date)
        let endDateFormattingString = dateFormatter.string(from: endDateTimeUIField.date)
        
        //let initDate = dateFormatter.date(from:formattingDateString)!
       // print("initDate: \(initDate)")
        
        let modelInfo = EventModel(eventId: 1, userId: 1, eventName: eventNameUIField.text!, eventStartDateTime: formattingDateString, eventEndDateTime: endDateFormattingString)
        
        let isSave = DatabaseManager.getInstance().addEvent(modelInfo)
        print(isSave)
        if(isSave==true){
            showAlert("Event added")
            eventNameUIField.text! = ""
            //dateTimeUIField.reset()
        }else{
            showAlert("Please try again!")
        }
         
        print(eventNameUIField.text!)
        print(dateTimeUIField.date)
        print(endDateTimeUIField.date)
    }
    
    func showAlert(_ msg: String) {
        let alert = UIAlertController(title: "Alert", message: msg , preferredStyle: .alert)
        self.present(alert, animated: true, completion: nil)
        Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false, block: { _ in alert.dismiss(animated: true, completion: nil)} )
    }
}

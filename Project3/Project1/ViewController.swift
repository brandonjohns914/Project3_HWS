//
//  ViewController.swift
//  Project1
//
//  Created by Brandon Johns on 4/19/23.
//

import UIKit

class ViewController: UITableViewController {

    var pictures: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Ellie Viewer"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let file_manger = FileManager.default
        let path_image = Bundle.main.resourcePath!
        let images = try! file_manger.contentsOfDirectory(atPath: path_image)
        
        for image in images.sorted()
        {
            if image.hasPrefix("Ellie")
            {
                
                pictures.append(image)
            }
        }
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //"Picture" is the Cell name in Interface Builder
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        
        cell.textLabel?.text = pictures[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //"Detail" is the storyboard ID for the detail view controller
        if let view_controller = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController
        {
            view_controller.selected_Image = pictures[indexPath.row]
            navigationController?.pushViewController(view_controller, animated: true)
        }
    }
}

//["Ellie0", "Ellie1", "Ellie2", "Ellie3","Ellie4", "Ellie5", "Ellie6", "Ellie7","Ellie8", "Ellie9", "Ellie10", "Ellie11","Ellie12", "Ellie13", "Ellie14", "Ellie15","Ellie16", "Ellie17", "Ellie18", "Ellie19","Ellie20", "Ellie21", "Ellie22", "Ellie23","Ellie24", "Ellie25", "Ellie26", "Ellie27","Ellie28", "Ellie29", "Ellie30", "Ellie31","Ellie32", "Ellie33", "Ellie34", "Ellie35"]

//
//  TableViewPracticeVC.swift
//  Sopt-3rd-Seminar
//
//  Created by 이유진 on 2022/04/23.
//

import UIKit

class TableViewPracticeVC: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: TVC.identifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: TVC.identifier)
        
        tableView.delegate = self
        tableView.dataSource = self

    }
}

extension TableViewPracticeVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
}

extension TableViewPracticeVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MusicDataModel.sampleData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TVC.identifier, for: indexPath) as? TVC else { return UITableViewCell() }
        
        cell.setData(MusicDataModel.sampleData[indexPath.row])
        
        return cell
    }
}

//
//  HomeViewController.swift
//  Instagram-Clone
//
//  Created by 이유진 on 2022/04/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    private let headerBar = HeaderBarView()
    private let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        registerNib()
        setTableView()
    }
       
    
    func registerNib(){
        let nib1 = UINib(nibName: StoriesTVC.identifier, bundle: nil)
        tableView.register(nib1, forCellReuseIdentifier: StoriesTVC.identifier)
        
        let nib2 = UINib(nibName: FeedTVC.identifier, bundle: nil)
        tableView.register(nib2, forCellReuseIdentifier: FeedTVC.identifier)
    }
    
    func setTableView(){
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension//테이블뷰 셀크기 동적 설정
        tableView.separatorStyle = .none
    }
    
    func setLayout(){
        view.addSubViews([headerBar,tableView])
        self.navigationController?.navigationBar.isHidden = true
        
        headerBar.snp.makeConstraints{
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(44)
        }
        tableView.snp.makeConstraints{
            $0.top.equalTo(headerBar.snp.bottom)
            $0.leading.bottom.trailing.equalToSuperview()
        }
        
    }
    


}

extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return FeedDataModel.sampleData.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row{
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: StoriesTVC.identifier,for: indexPath) as? StoriesTVC else {return UITableViewCell()}
            return cell
        default:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: FeedTVC.identifier,for: indexPath) as? FeedTVC else {return UITableViewCell()}
            cell.setData(feedData: FeedDataModel.sampleData[indexPath.row - 1])//첫번째 셀이 스토리보드 셀이라 인덱스가 하나씩 밀림
            cell.tabLikeButtonDelegate = self
            return cell
        }
        
    }
}

extension HomeViewController: TabLikeButtonDelegate{
    func tabLikeButton(cell: FeedTVC) {//좋아요 눌릴 때 하트 버튼 색깔 처리
        switch cell.isLike{
        case true:
            cell.likeButton.setImage(UIImage(named: "icn_unlike"), for: .normal)
            cell.isLike.toggle()
        case false:
            cell.likeButton.setImage(UIImage(named: "icn_like"), for: .normal)
            cell.isLike.toggle()
        }
       
    }
    
    
}

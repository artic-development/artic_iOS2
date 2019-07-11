//
//  SearchViewController.swift
//  Artic
//
//  Created by Jung Yoon Hyuk on 02/07/2019.
//  Copyright © 2019 choyi. All rights reserved.
//

import UIKit
import TagListView

class SearchViewController: UIViewController, TagListViewDelegate, UITextFieldDelegate {

    
    @IBOutlet weak var SearchTF: UITextField!
    
    @IBOutlet weak var Taglist: TagListView!
    @IBOutlet weak var Taglist_2: TagListView!
    @IBOutlet weak var Taglist_3: TagListView!
    var recommend : [Recommend] = [Recommend(search_word: ""),Recommend(search_word: ""),Recommend(search_word: ""),Recommend(search_word: ""),Recommend(search_word: ""),Recommend(search_word: ""),Recommend(search_word: ""),Recommend(search_word: ""),Recommend(search_word: "")]
    var keywords : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Taglist.delegate = self
        Taglist_2.delegate = self
        Taglist_3.delegate = self
        getRecommend()

        // Do any additional setup after loading the view.
        SearchTF.layer.cornerRadius = 25
        SearchTF.keyboardType = .default
        SearchTF.setLeftPaddingPoints(50)

        SearchTF.delegate = self
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }//화면터치하여 키보드 내리기
    @IBAction func onBack(_ sender: Any) {
         self.dismiss(animated: true)
    }
    //뒤로 가기
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let storyboard = UIStoryboard(name: "searchLinkResultSB", bundle: nil)
        guard let dvc = storyboard.instantiateViewController(withIdentifier: "searchLinkResultTableVC") as? searchLinkResultTableVC
            else {return true}
        
        //dvc.searchKeyword = title
        dvc.searchKeyword = SearchTF.text!
        print(SearchTF.text!)
        
        self.navigationController?.pushViewController(dvc, animated: true)
        return true
    }
    
    func tagPressed(_ title: String, tagView: TagView, sender: TagListView) {
        print("Tag pressed: \(title)")
        let storyboard = UIStoryboard(name: "searchLinkResultSB", bundle: nil)
        guard let dvc = storyboard.instantiateViewController(withIdentifier: "searchLinkResultTableVC") as? searchLinkResultTableVC
            else {return}
        
        //dvc.searchKeyword = title
//        dvc.searchResultKeyword.text = title
        dvc.searchKeyword = title
        
        self.navigationController?.pushViewController(dvc, animated: true)
    }
    
    
    func getRecommend() {
        
        RecommendService.shared.getRecommend() {
            
            [weak self]
            (data) in
            
            guard let `self` = self else { return }
            
            switch data {
                
            case .success(let result):
                //let _result = result as! [Recommend]
                //self.recommend = _result
                self.recommend = result as! [Recommend]
                //print(result)
                
            self.Taglist.addTags([self.recommend[0].search_word,self.recommend[1].search_word,self.recommend[2].search_word])
                
                self.Taglist.textFont = UIFont(name: "NanumBarunGothic", size: 14.0)!
                self.Taglist.paddingX = 18
                self.Taglist.paddingY = 13
                
            self.Taglist_2.addTags([self.recommend[3].search_word,self.recommend[4].search_word,self.recommend[5].search_word])
                
                self.Taglist_2.textFont = UIFont(name: "NanumBarunGothic", size: 14.0)!
                self.Taglist_2.paddingX = 18
                self.Taglist_2.paddingY = 13
                
            self.Taglist_3.addTags([self.recommend[6].search_word,self.recommend[7].search_word,self.recommend[8].search_word])
                
                self.Taglist_3.textFont = UIFont(name: "NanumBarunGothic", size: 14.0)!
                self.Taglist_3.paddingX = 18
                self.Taglist_3.paddingY = 13
                
                print(self.recommend[1].search_word)
                
            case .requestErr(let message):
                print(message)
            case .pathErr:
                print("pathErr at getRecommend")
            case .serverErr:
                print("serverErr")
            case .networkFail:
                print("networkFail")
            }
        }
    }
    
}

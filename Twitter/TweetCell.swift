//
//  TweetCell.swift
//  Twitter
//
//  Created by Cassey Anene on 2/8/22.
//  Copyright © 2022 Dan. All rights reserved.
//

import UIKit

class TweetCell: UITableViewCell {
    
    
    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBOutlet weak var usernameLabel: UILabel!
    
    @IBOutlet weak var tweetContent: UILabel!
    
    @IBOutlet weak var retweetButton: UIButton!
    
    @IBOutlet weak var favButton: UIButton!
    
    var favorited:Bool = false
    var tweetId:Int = -1
    var retweeted:Bool = false
    
    @IBAction func favotiteTweet(_ sender: Any) {
        let tobeFavorited = !favorited
        if (tobeFavorited) {
            TwitterAPICaller.client?.favoriteTweet(tweetId: tweetId, success: {
                self.setFavorited(true)
            }, failure: { (error) in
                print("Favorite did not suceed \(error)")
            })
        } else {
            TwitterAPICaller.client?.unfavoriteTweet(tweetId: tweetId, success: {
                self.setFavorited(false)
            }, failure: { (error) in
                print("Unfavorite did not suceed \(error)")
            })
            
        }
        
    }
    
    @IBAction func retweetTweet(_ sender: Any) {
        let tobeRetweeted = !retweeted
        if (tobeRetweeted) {
            TwitterAPICaller.client?.retweetTweet(tweetId: tweetId, success: {
                self.setRetweeted(true)
            }, failure: { (error) in
                print("Retweet did not suceed \(error)")
            })
        } else {
            TwitterAPICaller.client?.unretweetTweet(tweetId: tweetId, success: {
                self.setRetweeted(false)
            }, failure: { (error) in
                print("Unfavorite did not suceed \(error)")
            })
            
        }
        
    }
    
    func setFavorited(_ isFavorited:Bool) {
        favorited = isFavorited
        if (favorited) {
            favButton.setImage(UIImage(named:"favor-icon-red"), for: UIControl.State.normal)
        }
        else {
            favButton.setImage(UIImage(named:"favor-icon"), for: UIControl.State.normal)
        }
    }
    
    func setRetweeted(_ isRetweeted:Bool) {
        retweeted = isRetweeted
        if (retweeted) {
            retweetButton.setImage(UIImage(named:"retweet-icon-green"), for: UIControl.State.normal)
        }
        else {
            retweetButton.setImage(UIImage(named:"retweet-icon"), for: UIControl.State.normal)
        }
    }
    

    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

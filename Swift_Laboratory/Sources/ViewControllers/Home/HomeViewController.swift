//
//  HomeViewController.swift
//  Swift_Laboratory
//
//  Created by 中久木 雅哉(Nakakuki Masaya) on 2023/06/27.
//  Copyright (c) 2023 ReNKCHANNEL. All rihgts reserved.
//

import UIKit
import RxSwift
import RxCocoa

class HomeViewController: UIViewController {

    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var datePicker: UIDatePicker!
    @IBOutlet private weak var registerButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        registerButton.layer.cornerRadius = 12
    }

    private func setNotification() {
        let content = UNMutableNotificationContent()
        content.title = "通知だよ" // 通知タイトル
        content.body = "確認してね" // 通知内容
        content.sound = UNNotificationSound.default // 通知音
        // ローカル通知が発動するtrigger（日付マッチ）を作成
        let calendar = Calendar.current
        let dateComponents = calendar.dateComponents([.year, .month, .day, .hour, .minute], from: datePicker.date)
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        // identifier, content, triggerからローカル通知を作成
        let identifier = "MyNotification"
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
        let center = UNUserNotificationCenter.current()
        center.add(request) { (error) in
            print(error ?? "ローカル通知登録 OK")  // error が nil ならローカル通知の登録に成功したと表示します。errorが存在すればerrorを表示します。
        }

        // 未通知のローカル通知一覧をログ出力
        center.getPendingNotificationRequests { (requests: [UNNotificationRequest]) in
            for request in requests {
                print("/---------------")
                print(request)
                print("---------------/")
            }
        }
        guard let hour = dateComponents.hour, let minute = dateComponents.minute else { return }
        dateLabel.text = "\(hour)時\(minute)分に通知が届くよ！"
    }

    @IBAction func setNotificationAction(_ sender: Any) {
        setNotification()
    }

}

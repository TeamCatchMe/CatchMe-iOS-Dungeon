//
//  ViewController.swift
//  CustomCalendar
//
//  Created by SHIN YOON AH on 2021/07/01.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Properties
    let dateFormatter = DateFormatter()
    var components = DateComponents()
    var weeks: [String] = [ "일", "월", "화", "수", "목", "금", "토" ]
    var days: [String] = []
    var daysCountInMonth = 0
    var weekdayAdding = 0
    
    // MARK: - IBOutlets
    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var weekdayCollectionView: UICollectionView!
    @IBOutlet weak var dateCollectionView: UICollectionView!
    
    // MARK: - Dummy Data
    let dummyFormatter = DateFormatter()
    var dummyDate: [String] = ["2021-09-13", "2022-01-01", "2021-07-17", "2021-06-15", "2021-06-16", "2021-06-17", "2021-06-18", "2021-06-25"]
    var monthDate: [String] = []
    
    // MARK: - Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        initCalendar()
        makeMonthDate()
        initView()
    }
    
    // MARK: - IBActions
    @IBAction func previousButtonClicked(_ sender: Any) {
        components.month = components.month! - 1
        self.calculation()
        self.makeMonthDate()
        self.dateCollectionView.reloadData()
    }
    
    @IBAction func nextButtonClicked(_ sender: Any) {
        components.month = components.month! + 1
        self.calculation()
        self.makeMonthDate()
        self.dateCollectionView.reloadData()
    }
    
    func makeMonthDate() {
        monthDate.removeAll()
        
        let firstDayOfMonth = Calendar.current.date(from: components)
        dateFormatter.dateFormat = "YYYY"
        let year = dateFormatter.string(from: firstDayOfMonth!)
        dateFormatter.dateFormat = "MM"
        let month = dateFormatter.string(from: firstDayOfMonth!)
        
        dummyFormatter.dateFormat = "YYYY"
        for date in dummyDate {
            let string = date.split(separator: "-")
            
            if string[0] == year && string[1] == month {
                monthDate.append(String(string[2]))
            }
        }
        
        print(monthDate)
    }
}


// MARK: - Helpers
extension ViewController {
    private func initView() {
        initUI()
        initCollectionView()
        self.calculation()
    }
    
    private func initUI() {
        view.backgroundColor = .black
        
        monthLabel.textColor = .white
        monthLabel.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        
        dateFormatter.dateFormat = "M월 YYYY"
    }
    
    private func initCollectionView() {
        weekdayCollectionView.delegate = self
        weekdayCollectionView.dataSource = self
        weekdayCollectionView.register(dayCell.self, forCellWithReuseIdentifier: dayCell.identifier)
        weekdayCollectionView.backgroundColor = .black
        
        dateCollectionView.delegate = self
        dateCollectionView.dataSource = self
        dateCollectionView.register(dayCell.self, forCellWithReuseIdentifier: dayCell.identifier)
        dateCollectionView.backgroundColor = .black
    }
    
    private func initCalendar() {
        components.year = Calendar.current.component(.year, from: Date())
        components.month = Calendar.current.component(.month, from: Date())
        components.day = 1
    }
    
    private func calculation() {
        let firstDayOfMonth = Calendar.current.date(from: components)
        let firstWeekday = Calendar.current.component(.weekday, from: firstDayOfMonth!)
        daysCountInMonth = Calendar.current.range(of: .day,
                                        in: .month,
                                        for: firstDayOfMonth!)!.count
        
        weekdayAdding = 2 - firstWeekday
        
        dateFormatter.dateFormat = "M월 YYYY"
        self.monthLabel.text = dateFormatter.string(from: firstDayOfMonth!)
        
        self.days.removeAll()
        for day in weekdayAdding...daysCountInMonth {
            if day < 1 {
                self.days.append("")
            } else {
                self.days.append(String(day))
            }
        }
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section:Int) -> Int {
        if collectionView == weekdayCollectionView {
            return 7
        } else {
            return days.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath:IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case weekdayCollectionView:
            let cell = weekdayCollectionView.dequeueReusableCell(withReuseIdentifier: dayCell.identifier, for: indexPath) as! dayCell
            
            cell.dataLabel.text = weeks[indexPath.row]
            
            cell.dataLabel.font = UIFont.systemFont(ofSize: 15)
            cell.dataLabel.textColor = .darkGray
            
            return cell
            
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier:dayCell.identifier, for: indexPath) as! dayCell
            
            cell.dataLabel.text = days[indexPath.row]
            
            cell.dataLabel.font = UIFont.systemFont(ofSize: 18, weight: .medium)
            cell.dataLabel.textColor = .white
            
            return cell
        }
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout:UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let weekBoundSize = UIScreen.main.bounds.size.width - 32 - 42
        let dayBoundSize = UIScreen.main.bounds.size.width - 32 - 24
        var cellSize = 0
        
        switch collectionView {
        case weekdayCollectionView:
            cellSize = Int(weekBoundSize / 7)
            return CGSize(width: cellSize,
                            height: 43)
        default:
            cellSize = Int(dayBoundSize / 7)
            return CGSize(width: cellSize,
                            height: 51)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        switch collectionView {
        case weekdayCollectionView:
            return 7
        default:
            return 4
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout:UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    }
}


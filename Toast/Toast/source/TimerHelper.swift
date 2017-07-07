//
//  TimerHelper.swift
//  driverphone
//
//  Created by caijinglong on 2017/6/25.
//

import Foundation

@objc
protocol TimerDelegate {
    func timerInvoke(_ nowTime: TimeInterval)

    @objc optional func timerFinish()
}

class TimerHelper {

    var timer: Timer?
    var startTime: TimeInterval = 0
    var total: TimeInterval = 0
    var interval: TimeInterval = 0
    var delegate: TimerDelegate? = nil

    init(total: TimeInterval, interval: TimeInterval, _ delegate: TimerDelegate) {
        self.total = total
        self.interval = interval
        self.delegate = delegate
    }

    @objc func count(_ sender: Timer) {
        let currentTime = NSDate().timeIntervalSince1970
        let now = total - (currentTime - startTime)
        if (now <= 0) {
            stop()
            delegate?.timerFinish!()
        } else {
            delegate?.timerInvoke(now)
        }
    }

    func start() {
        startTime = NSDate().timeIntervalSince1970
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(TimerHelper.count(_:)), userInfo: nil, repeats: true)
        timer?.fire()
    }

    func stop() {
        timer?.invalidate()
        timer = nil
    }

}

func runDelay(_ delay:TimeInterval,_ block:@escaping () -> ()){
    let queue = DispatchQueue.main
    
    let delayTime = DispatchTime.now() + delay
    
    queue.asyncAfter(deadline: delayTime) {
        block()
    }
}

func run(queue:DispatchQueue = DispatchQueue.main ,_ block:@escaping () -> ()){
    queue.async {
        block()
    }
}

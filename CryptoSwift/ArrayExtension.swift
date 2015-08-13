//
//  ArrayExtension.swift
//  CryptoSwift
//
//  Created by Marcin Krzyzanowski on 10/08/14.
//  Copyright (c) 2014 Marcin Krzyzanowski. All rights reserved.
//

import Foundation

extension Array {
    
    /** split in chunks with given chunk size */
    func chunks(chunksize:Int) -> [Array<Element>] {
        var words = [[Element]]()
        words.reserveCapacity(self.count / chunksize)        
        for var idx = chunksize; idx <= self.count; idx = idx + chunksize {
            let word = Array(self[idx - chunksize..<idx]) // this is slow for large table
            words.append(word)
        }
        let reminder = Array(self.suffix(self.count % chunksize))
        if (reminder.count > 0) {
            words.append(reminder)
        }
        return words
    }
}

extension RawData {
    
    /** split in chunks with given chunk size */
    func chunks(chunksize:Int) -> Array<RawData> {
        var words = [RawData]()
        words.reserveCapacity(self.count / chunksize)
        for var idx = chunksize; idx <= self.count; idx = idx + chunksize {
            let word = RawData(self[idx - chunksize..<idx]) // this is slow for large table
            words.append(word)
        }
        let reminder = RawData(self.suffix(self.count % chunksize))
        if (reminder.count > 0) {
            words.append(reminder)
        }
        return words
    }
}

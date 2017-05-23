//
//  main.m
//  Lucky Numbers
//
//  Created by Lucyna Galik on 10/02/2017.
//  Copyright © 2017 Lucyna Galik. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // generate Lucky Numbers upto a given limit
        // Start with the natural numbers.
        // Delete every 2nd number, leaving 1 3 5 7 ...;
        // the 2nd number remaining is 3, so delete every 3rd number, leaving 1 3 7 9 13 15 ...;
        // now delete every 7th number, leaving 1 3 7 9 13 ...;
        // now delete every 9th number; etc.
        
        int limit = 100;
        NSMutableArray *listOfNumbers = [NSMutableArray array];
        
        
        if (limit < 3) {
            
            // The only Lucky Number below 3 is 1
            listOfNumbers = [@[[NSNumber numberWithInt: 1]] mutableCopy];
            
        } else {
            
            // create an mutable array of odd numbers upto the given limit
            for (int i = 1; i <= limit; i = i+2 ) {
                [listOfNumbers addObject: [NSNumber numberWithInt: i]];
            }
            
            // index of the second surviving number
            int index = 1;
            
            // while value at index is smaller than the current length of Array
            while ( [listOfNumbers[index] intValue] < ((int) [listOfNumbers count]) ) {
                
                // iterate over the listOfNumbers backwards
                for (int i = ((int) [listOfNumbers count] - 1); i  > index; i--){
                    // if the position (i+1) is divisible by number at index, remove it
                    if ( ((i+1) % [listOfNumbers[index] intValue]) == 0) {
                        [listOfNumbers removeObjectAtIndex: i];
                    }
                }
                // move to the next surviving number
                index++;
            }
        }
        
        NSLog(@"Lucky numbers upto %d are %@", limit, listOfNumbers);
        
    }
    return 0;
}




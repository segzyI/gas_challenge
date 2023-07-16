// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract gasChallenge {
    //Implement Fixed-Size Array Technique Here
    //Fixe size array implemented by specifying the numbers of element in array
    uint[10] numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];


    //Function to check for sum of array
    //No changes required in this function
    function getSumOfArray() public view returns (uint256) {
        uint sum = 0;
        for (uint i = 0; i < numbers.length; i++) {
            sum += numbers[i];
        }
        return sum;
    }

    function notOptimizedFunction() public {
        for (uint i = 0; i < numbers.length; i++) {
            numbers[i] = 0;
        }
    }

    //Implement Remaining Gas Optimization Techniques Here
    //Sum of elements in the numbers array should equal 0
    function optimizedFunction() public {
        // Cache the state variable using length variable
        uint length = numbers.length;

        // used an unchecked block to prevent type check
        unchecked {
            //used the cached state variable instead of numbers.length in a different loop
            for (uint i = 0; i < length; i+=1) {
                //reset each element in array to 0
                numbers[i] = 0; 
            }
        }
    }
}
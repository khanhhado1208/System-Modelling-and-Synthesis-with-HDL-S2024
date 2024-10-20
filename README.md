# Exercise 1
## DESIGN AND SIMULATION OF COMBINATIONAL LOGIC CONTROLLING LEDS WITH SWITCHES ON THE ZEDBOARD
#### In a competition consisting on an individual match between two contestants, A and B, three judges give 0 or 1 points to each of the contestants and a combinational system computes the winner. The score given by each of the judges can be one of four possible scenarios:
<img width="910" alt="image" src="https://github.com/user-attachments/assets/6c710071-bbd9-4675-8738-4e38c443c91f">

#### The votes from each of the judges are combined into two vectors, one containing the votes for contestant A and one for contestant B.
#### Table 3 includes a few examples. The first three columns include the vote of each of the three judges. The middle two columns show the two vectors containing the votes count for contestants A and B, respectively, the last column is the match winner (‘01’ or ‘10’), or if it’s a tie (‘11’ or ‘00’).
<img width="674" alt="image" src="https://github.com/user-attachments/assets/7a2c1e7a-5356-47b7-841e-5e24e7be17c8">

## Part 1: Design a combinational vote calculator
#### Design entity tally takes the two vectors as inputs and computes the two-bit output named winner. Given the following entity declaration for tally:
<img width="619" alt="image" src="https://github.com/user-attachments/assets/faa978c3-f0e4-4150-b2f7-33d3b41d0afa">

#### Write an architecture named loopy that computes the output winner. The computation to determine the winner must be performed using a loop statement. Use type integers in the intermediate computations for the final output value.

## Part 2: Simulation and Verification
#### Write a testbench that provides exhaustive verification of the tally scoring system. The testbench must use a loop to generate all possible input combinations. You should use different methods to calculate/obtain the winner in the module architecture and the testbench. You can use,
#### for example, table method as in the first exercise; array that contains the correct number of votes according to an input vector (array of integers). An input vector can be used as an index number; or some other method, you name it.
#### A function must be used to calculate the expected result for the tally. In other words, a function can only calculate the expected value or calculate the expected value and verify the correctness of the tally. For example, a function can be used in an assert statement as follows:
### assert( winner = result(scoresA, scoresB) )
#### where result is the name of the function, scoresA and scoresB are the input vectors to the tally, and winner the result calculated by your design. You may also do the comparison inside the body of the function:
### assert result(scoresA, scoresB, winner)

## Part 3: Generate Bitstream and Program Zedboard.
#### The next step is to implement the example provided in the appendix and then implement the code in the part1 on the Zedboard. You will need to set up the switches as inputs and have the led output on the TOP file. Think of the TOP file as the interface between the hardware and your source. All the functionality should be in your source file

# Exercise 2
## DESIGN, SIMULATION AND SYNTHESIS OF SEQUENTIAL LOGIC AND IMPLEMENTING ON THE ZEDBOARD
#### Universal Counter
#### There are many styles to design sequential logic. Even when all of them may behave in the same manner during simulations, each of these styles affects synthesis of the actual hardware in different ways. The task here is to design a clocked counter block that is loadable, resettable, and bidirectional
#### The specification of the counter are (see also the table below):
####  Counting when the input enable is b”1”, and paused otherwise.
####  Resetting occurs when the input reset is b”1”.
####  Counting up (output count increases) when input dir is b”0”, and vice-versa, count down when the dir is b”1”.
####  On overflow (underflow) set the output over to b”1” and set count to D”0” (or D”15”) then continue counting upwards (or downwards).
####  When both load and enable are b”1”, the counter loads the 4-bit vector from data and saves into count
<img width="541" alt="image" src="https://github.com/user-attachments/assets/7913aa1b-2309-40a5-b77b-44c3792bbb11">

#### You are required to write the module counter’s architecture within a single process. We recommend using variables for count. Implement with asynchronous active-low reset.
## Part1:
####  Design the counter component with the above specifications.
####  Write a test bench and check all possible functionalities of the counter, that is, reset, enable, counting direction, load data. Note that the test signals could either be synchronous or asynchronous with the simulated clock, but the output count and over can only be asynchronous on rst_n’s rising_edge
#### Simulate by showing on the waveform window all the relevant signals (e.g., clk, enable, rst_n, dir, count, over, data.
## Part2:
####  Implement the code in part1 on the zedboard, setting up the switches as inputs, LEDs as outputs and RESET button as reset.
####  Reminder: Zedboard internal clock is 100MHz, you have to use a frequency divider to shorten the counting slot.
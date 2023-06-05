# PID Controllers


PID controllers are an extremely useful tool for FRC programming, and real-world programing, but what are they really? Let's break it down into its three separate parts P(roportional), I(ntegral) and D(erivative). All terms are summed together, which makes the controller work the way it does.


[Wikipedia](https://en.wikipedia.org/wiki/PID_controller) has a good page (though it is math heavy), and there are several good videos on [Youtube](https://www.youtube.com/watch?v=XfAt6hNV8XM) about PID controllers.


## Proportional


The proportional term of a PID controller is just a ratio of how hard to go based on how far you've been away from your target. Let's say that you have a P constant of 0.05, and your robot wants to be traveling at 0 degrees, but it's currently at 20 degrees. In this case, the number of degrees off from zero is the input to the controller, and the controller will multiply the P value by the offset degrees to return its output of exactly 1. This is the simplest of PID controllers, but it can be very useful as there are lots of applications for a basic P controller.


## Integral


If you've ever dealt with calculus, you'll know exactly what this means, but if you haven't, don't worry, because you don't need to know exactly how it all works. If we go back to our example of the robot trying to head at a certain number of degrees, but this time with only an I value, the robot won't move right away. It will start to slowly turn, until it gains a lot of speed and often overshoots (Known as "I buildup"). What is happening is the I term is a multiple to the area under the distance/time graph.


[Graph of I](https://controlguru.com/wp-content/uploads/2015/08/piintsmall.jpg)


This amount of time that the robot has been away from its target will make the robot want to push harder and harder to reach the target until it is there. This can cause some issues though, as having too much I or P can cause overshoot, making the robot turn too far past its target.


## Derivative


The derivative is a fancy way of saying the slope at a given point in time. Including the D term in the mix will help to smooth out movement that is too jerky cause by I buildup and also too much P. If the function of the current angle is bouncing up and down, completely missing the target, the D term will settle it down as it will report a very high change in slope. This high change in slope will have the overall effect of slowing down, or "smoothing" the movements.



[PID Graph](https://apmonitor.com/pdc/uploads/Main/pi_control_response.png)


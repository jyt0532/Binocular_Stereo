Binocular Stereo
===================

The goal of this part is to implement a simple window-based stereo matching algorithm for rectified stereo pairs. You will be using the following stereo pair:

##Steps
1. Follow the basic outline given in this lecture: pick a window around each pixel in the first (reference) image, and then search the corresponding scanline in the second image for a matching window. The output should be a disparity map with respect to the first view (use this ground truth map for qualitative reference). You should experiment with the following settings and parameters:

    + Search window size: show disparity maps for several window sizes and discuss which window size works the best (or what are the tradeoffs between using different window sizes). How does the running time depend on window size?

    + Disparity range: what is the range of the scanline in the second image that should be traversed in order to find a match for a given location in the first image? Examine the stereo pair to determine what is the maximum disparity value that makes sense, where to start the search on the scanline, and which direction to search in. Report which settings you ended up using.

    + Matching function: try sum of squared differences (SSD) and normalized correlation. Discuss in your report whether there is any difference between using these two functions, both in terms of quality of the results and in terms of running time.

2. In addition to showing your results and discussing implementation parameters, discuss the shortcomings of your algorithm. Where do the estimated disparity maps look good, and where do they look bad? What would be required to produce better results? Also discuss the running time of your approach and what might be needed to make stereo run faster.

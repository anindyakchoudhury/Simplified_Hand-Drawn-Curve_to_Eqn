# Simplified Curve Fitting

## Project Overview
This repository contains a MATLAB-based curve fitting application that segments complex curves from images and approximates each segment with simple mathematical equations. The application uses image processing techniques to extract curve data points, smooths them, identifies peaks and troughs, and then fits appropriate equations to each segment.

## Background
This was my first laboratory project where I formulated the idea from scratch. Despite using relatively simple algorithms, the project successfully demonstrates the concept of curve segmentation and equation fitting. I had tremendous fun seeing the project come to life when it was completed, especially when testing it with different curve samples.

## Institution and Course Information
- **Institution**: Bangladesh University of Engineering and Technology (BUET)
- **Department**: Electrical and Electronic Engineering
- **Course**: EEE 212 Project
- **Instructors**:
  - Mr. Hamidur Rahman, Associate Professor
  - Shahed Ahmed, Lecturer
  - Shaimur Salehin Akash, Lecturer (PT)

## Project Contributors
- **Algorithm Implementation**: Anindya Kishore Choudhury (1906081)
- **GUI Design and Integration**: Md. Liton Ali (1906080)

## Approach
The project implements a five-step approach:
1. **Image Processing**: Reading and converting the image to binary form
2. **Smoothing**: Reducing noise and redundant pixels from the extracted curve data
3. **Peak Detection**: Identifying local maxima and minima to segment the curve
4. **Equation Fitting**: Comparing each segment against common mathematical functions
5. **Best Fit Selection**: Selecting the equation with minimum error for each segment

## Equation Library
The system compares curve segments against six common equation types:
1. Linear equation: y = mx + c
2. Second degree polynomial: y = ax² + bx + c
3. Third degree polynomial: y = ax³ + bx² + cx + d
4. Circular equation: x² + y² + 2gx + 2fy + c = 0
5. Rational equation: y = (x + A)/(Bx + C)
6. Exponential equation: y = e^(ax + b)

## Features
- Interactive GUI for easy visualization
- Image intensity adjustment for optimal curve extraction
- Customizable peak spacing to ignore noise
- Real-time visualization of curve segments and equations
- Error calculation for fit accuracy

## Applications
- Curve fitting from image data
- Equation extraction from oscilloscope outputs
- Potential application for road curve detection in autonomous vehicles

## Limitations and Future Work
Despite the successful implementation, several limitations were identified:

**Current Limitations:**
- Reduced accuracy at peak points
- Difficulty with vertical and horizontal lines
- Limited equation library
- Basic noise removal capabilities


## Personal Note
This was my first laboratory project where I developed the entire concept from scratch. While the implemented algorithms are simple and not highly efficient, the experience of seeing my idea transform into a working application was incredibly rewarding. The project represents an important first step in my engineering journey, demonstrating that even simple approaches can yield functional results.
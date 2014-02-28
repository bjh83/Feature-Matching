Feature Matching And Homography Estimation
==========================================
This is a purely educational project attempting to create a simple library for
sparse feature matching and homography estimation. The short term goal is to 
learn more about feature matching. The long term goal is to create a suite of 
tools that allow me to do experiments with projective and camera based multiple
view geometry.

Feature Detection
-----------------
I use a simple Forster-Harris feature detector (corner detector as some call it)
to measure the 'goodness' of a point as the center of a feature. I then reduce
the 'corner score map' by doing a non-addaptive non-maximal suppression 
subsampling. Since the long term goal is to use point correspondences to create
a homography describing the relationship between the given images, I do not need
a terribly large (or consistent) number of point correspondances; really, the
things that matter are that the point correspondences are high quality (accurate
and precise), that they cover a wide range of the image, and that they are not 
colinear.

Feature Description
-------------------
I am currently in the process of implementing a SIFT like feature matcher 
described in Brown, Szeliski, and Winder's "Multi-Image Matching using 
Multi-Scale Oriented Patches."

Homograpy Computation
---------------------
The plan here is to use the normalized Direct Linear Transformation (DLT) using
the point correspondances computed above. I am pretty new to this stuff and I
have no idea how well this will work aside from some reading, so we will see how
this goes and maybe try an iteratively based refinement of some sort.

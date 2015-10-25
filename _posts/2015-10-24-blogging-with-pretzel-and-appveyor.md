---
layout: post
title: "Blogging With Pretzel And AppVeyor"
teaser: "Blogging With Pretzel And AppVeyor"
---

I started this blog to start writing down cool things that I've worked with and lessons I've learned. What better way than to start with the tools and scripts I'm using with this blog.

I started with researching static site generators. Since I'm a .Net developer I decided to stick with what I know and chose [Pretzel](https://github.com/Code52/pretzel) from the [Code52 Project](http://code52.org/). 

I host this site on Github.io which allows for easy pushing to the site via Git. My first pass setting up a deployment pipeline was to create a powershell script that runs pretzel and copies the output to a new directory which would be checked into the deployment git repository.

<script src="https://gist.github.com/dustinchilson/3d473bb1ddd6785fb9f4.js"></script>

After a little bit of setup I thought it would be cool to have CI just like my development projects. [AppVeyor](http://www.appveyor.com/) is a CI service that links into Github and runs build scripts for each check-in. 

Using AppVeyor I was able to automate the whole process. 

1. Check in a new post or site edit
2. AppVeyor picks up the Change
3. Runs Pretzel
4. Checks the result into GitHub

To accomplish this I setup a new AppVeyor project and configured it to run a few scripts.

<script src="https://gist.github.com/dustinchilson/c4d03cb2340642a60e4c.js"></script>

Before the build I need to setup the git credentials that will be used to push the pretzel output to github. I also clone the existing site repository to prepare for the final output.

<script src="https://gist.github.com/dustinchilson/b82b1a6325263e1b88ce.js"></script>

Next the build script cleans the cloned repository except for the .git folder. The cleaning step is needed to remove any files that are not in the new output from Pretzel. Pretzel then rebuilds the entire site.

<script src="https://gist.github.com/dustinchilson/3ceadef0ac1dba0041e8.js"></script>

Finally the On Sucess script commits the output to the site repository with the same commit message as used in the first checkin.

<script src="https://gist.github.com/dustinchilson/63d498836b4f96e472e8.js"></script>
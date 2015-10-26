--- 
layout: post
title: "My First Post, And how to deploy Azure Webjobs with Octopus Deploy"
teaser: "How to deploy Azure Webjobs with Octopus Deploy."
guid: cce8ca62-5ef1-4e0c-b0b1-9188ff25301a
---

Octopus deploy is an amazing tool, but one issue it had pre-3.0 is deploying to azure websites. The best way to accomplish this is to use the [Web Deploy Step](https://library.octopusdeploy.com/#!/step-template/actiontemplate-web-deploy-publish-website-(msdeploy)) available in the script library.

Once you've deployed your site you might need to deploy a background worker. A WebJob is deployed to special folder underneath the site's root folder. To Accomplish this I've forked the Web Deploy Step and modified it to deploy azure webjobs.

<script src="https://gist.github.com/dustinchilson/ee4de3d646fd33351be1.js"></script>
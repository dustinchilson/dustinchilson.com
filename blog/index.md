---
layout : layout
title : Blog
---
{% for post in site.posts  limit:5 %}

<h2>
    <a href="{{ post.url }}">{{ post.title }}</a>
</h2>
<p><span class="glyphicon glyphicon-time"></span> Posted on {{ post.date | date: "%e %B, %Y"  }}</p>
<hr>
<img class="img-responsive" src="{{ post.image }}" alt="">
<hr>
<p>{{ post.teaser }}</p>
<a class="btn btn-primary" href="{{ post.url }}">Read More <span class="glyphicon glyphicon-chevron-right"></span></a>
<hr>

{% endfor %}

<!-- Pager -->
<ul class="pager">
    <li class="previous">
        <a href="#">&larr; Older</a>
    </li>
    <li class="next">
        <a href="#">Newer &rarr;</a>
    </li>
</ul>
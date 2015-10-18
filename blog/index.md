---
layout : layout
title : Blog
---
<section class="inner">
  <h1>Blog</h1>
  <p>My ramblings.</p>
  <ul class="posts">
    {% for post in site.posts %}
      <li>
        <strong><a href="{{ post.url }}">{{ post.title }}</a></strong>
        <br />
        <span class="date">{{ post.date | date_to_string }}</span>
        <br />
        <span class="description">{{ post.teaser }}</span>
      </li>
    {% endfor %}
  </ul>
</section>
</ul>
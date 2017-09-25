---
# You don't need to edit this file, it's empty on purpose.
# Edit theme's home layout instead if you wanna make some changes
# See: https://jekyllrb.com/docs/themes/#overriding-theme-defaults
layout: page
id: index
---
<article class="card">
    <div href="#">
        <img src="http://placehold.it/1920x1080">
        <div class="card-content">
            <p>
              I collect TUTORIALS, RESOURCES and all kinds of LINKS,
              then I organize everything in GUIDES, making easier to LEARN ANYTHING
            </p>
        </div><!-- .card-content -->
    </div>
</article><!-- .card -->
{% for post in site.posts %}
 <article class="card">
      <a href="{{ site.baseurl }}{{ post.url }}">
          <img src="http://placehold.it/1920x1080">
          <div class="card-content">
              <h2>{{ post.title }}</h2>
              <p>JavaScript is a programming language that allows you to implement complex things on web pages</p>
          </div><!-- .card-content -->
      </a>
  </article><!-- .card -->
{% endfor %}
---
# You don't need to edit this file, it's empty on purpose.
# Edit theme's home layout instead if you wanna make some changes
# See: https://jekyllrb.com/docs/themes/#overriding-theme-defaults
layout: page
id: index
---

# INDEX


<!-- {% for post in site.posts %}
  <h3><a href="{{ site.baseurl}}{{ post.url }}">{{ post.title }}</a></h3>
  <p>{{ category.description }}</p>
{% endfor %} -->

{% for category in site.categories %}
  {% capture category_name %}{{ category | first }}{% endcapture %}
   <a href="{{ site.baseurl }}/{{ category_name }}/">{{ category_name }}</a>
{% endfor %}
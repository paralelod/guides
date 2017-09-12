---
layout: post
title: Advanced Webdesign + Static Websites with Jekyll
---

<h2>Index</h2>
<ul>
    {% for category in site.data.webdev-jekyl_categories %}
        <li>
            <h3><a href="#{{ category.idcategory }}">{{ category.title }}</a></h3>
            <p>{{ category.description }}</p>
        </li>
    {% endfor %}
</ul>
<br><br><br>
<h2>Get Started</h2>

Há muita informação aqui e, embora possa se sentir avassaladora ao ver tudo apresentado dessa maneira, recomendamos baixar um PDF desse guia para que você possa imprimi-lo e mantê-lo em sua mesa.
<br>
<br>
Ou pegue esta postagem no blog na nossa planilha fácil de digitalizar com todos os recursos 225+ em um só lugar
<br><br>

{% for category in site.data.webdev-jekyl_categories %}
  <a name="{{ category.idcategory }}"></a>
  <h3>{{ category.title }}</h3>
  <img src="{{ site.url }}/images/hello.svg" alt="sample image">
  <ul>
    {% for item in site.data.webdev-jekyl_links %}
      {% if category.idcategory == item.categoryid %}
        <li>
            <p>
              <a href="{{ item.url }}" target="blank">{{ item.linktitle }}</a>
               :: {{ item.description | truncate: 99 }}
            </p>
        </li>
      {% endif %}
    {% endfor %}
  </ul>
{% endfor %}

---
---

const VERSION = "3.0.1";

// const cacheName = 'techqueria-org';
const APP_CACHE_NAME = 'diogoruss-app';
const STATIC_CACHE_NAME = 'diogorusso-static';

console.log(`installing sw.js`);

const CACHE_STATIC = [
    'https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js',
    'https://cdnjs.cloudflare.com/ajax/libs/jquery.lazyloadxt/1.1.0/jquery.lazyloadxt.min.js',
    'https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js',
    'https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.js',
    './assets/style.css',
    '{{site.cdn}}about/cover.jpg',
    '{{site.cdn}}about/bio/diogorusso.jpg',
    '{{site.cdn}}about/bio/skill.bg',
    '{{site.cdn}}about/process/step_0.jpg',
    '{{site.cdn}}about/process/step_1.jpg',
    '{{site.cdn}}about/process/step_2.jpg',
    '{{site.cdn}}about/process/step_3.jpg',
    '{{site.cdn}}about/process/step_4.jpg'   
 ];

 const CACHE_APP = [
    '/',
    '/index.html'
 ];

self.addEventListener('install',function(e){
    e.waitUntil(
        Promise.all([
            caches.open(STATIC_CACHE_NAME),
            caches.open(APP_CACHE_NAME),
            self.skipWaiting()
          ]).then(function(storage){
            var static_cache = storage[0];
            var app_cache = storage[1];
            return Promise.all([
              static_cache.addAll(CACHE_STATIC),
              app_cache.addAll(CACHE_APP)]);
        })
    );
});

self.addEventListener('activate', function(e) {
    e.waitUntil(
        Promise.all([
            self.clients.claim(),
            caches.keys().then(function(cacheNames) {
                return Promise.all(
                    cacheNames.map(function(cacheName) {
                        if (cacheName !== APP_CACHE_NAME && cacheName !== STATIC_CACHE_NAME) {
                            console.log('deleting',cacheName);
                            return caches.delete(cacheName);
                        }
                    })
                );
            })
        ])
    );
});

this.addEventListener('fetch', function(event) {
  var response;
  event.respondWith(caches.match(event.request)
    .then(function (match) {
      return match || fetch(event.request);
    }).catch(function() {
      return fetch(event.request);
    })
    .then(function(r) {
      response = r;
      caches.open(cacheName).then(function(cache) {
        cache.put(event.request, response);
      });
      return response.clone();
    })
  );
});
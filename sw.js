---
---
 
const staticCacheName = "v1";
 
console.log("installing service worker");
 
const filesToCache = [
  "{{site.url}}{{site.baseurl}}/",
  "{{site.url}}{{site.baseurl}}/index.html",
  "{{site.url}}{{site.baseurl}}/404.html"
];


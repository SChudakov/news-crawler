# news-crawler
Dockerized news crawler based on the Elasticsearch storage.


## Prerequisites
 
 
 - Git
 - Docker


## Installation

```
git clone https://github.com/SChudakov/news-crawler.git
cd news-crawler

docker build -t news_crawler .
docker run -ti -p 9200:9200 -p 9300:9300 -p 5000:5000 -e "discovery.type=single-node" news_crawler bash
```

## Access Data

Open a browser and connect to the `localhost:5000` to access the Elasticsearch dashboard. 
Navigate to the `Query` tab by pressing the corresponding button in the up-right corner of the view.
There you can retrieve crawler data.

## Sites list

- unian.ua
- ukr.segodnya.ua
- ukr.net
- 24tv.ua
- tsn.ua
- censor.net.ua

You can changes the crawler web pages by modifying the `news-please-repo/config/sitelist.hjson` file
and rebuilding the image.
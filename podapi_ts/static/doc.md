# Podcaast API

## Available Paths

Get top Podcasts: `podapi.appgewaltig.de/charts`

Get lookupData for a Podcast: `podapi.appgewaltig.de/charts/lookup?id=XXX`

Get a podcast feed: `podapi.appgewaltig.de/feed?id=XXX`

Search for Podcasts: `podapi.appgewaltig.de/search?searchTerm=XXX`

## `/charts`

#### Available query parameters:

- `language`: language/country codes like `de`, `us`, `fr`
- `limit`: default `30`, up to `200`
- `explicit`: default `true`
- `genre`: no default value. use a genre id number here
- `withLookup`: default value false. This adds a lookup for every element. Takes more time to load.

#### Response

```json
{
  "entries": [
    {
      "id": "00000",
      "title": "title",
      "summary": "summary",
      "releaseDate": "01.01.1970",
      "category": "category",
      "artist": "artist",
      "thumbnails": [
        "https://static.values.com/image/55x55bb.png",
        "https://static.values.com/image/60x60bb.png",
        "https://static.values.com/image/170x170bb.png"
      ]
    },
  ]
```

## `/charts/lookup`

#### Available query parameters:

- `id`: add the id from the chartsItem

#### Response

```json
{
  "resultCount": 1,
  "results": [
    {
      "trackId": 1489481533,
      "artistName": "artistname",
      "trackName": "trackname",
      "feedUrl": "https://feedurl/feed",
      "artworkUrl100": "https://image/100x100bb.jpg",
      "artworkUrl600": "https://image/600x600bb.jpg",
      "releaseDate": "2020-01-19T09:00:00Z",
      "genres": ["News", "Podcasts"],
      "genreIds": ["1489", "26"]
    }
  ]
}
```

## `/feed`

#### Available query parameters:

- `id`: add the id from the chartsItem or lookupItem

#### Response

```json
{
  "title": "title",
  "lastBuild": "Sun, 19 Jan 2020 09:00:32 +0000",
  "description": "description",
  "image": "https://imageUrl.jpg",
  "owner": "owner",
  "items": [
    {
      "title": "title",
      "description": "description",
      "pubDate": "Sun, 19 Jan 2020 09:00:00 +0000",
      "link": "https://link.com",
      "episode": 1,
      "mediaUrl": "https://podcasthost.com/episode234234.mp3"
    },
    {
      "title": "title",
      "description": "description",
      "pubDate": "Sun, 19 Jan 2020 09:00:00 +0000",
      "link": "https://link.com",
      "episode": 2,
      "mediaUrl": "https://podcasthost.com/episode234234.mp3"
    }
  ]
}
```

## `/search`

#### Available query parameters:

- `searchTerm`: search terms like `crime`
- `country`: language/country codes like `de`, `us`, `fr`
- `explicit`: default value `true`

#### Response

```json
{
  "resultCount": 17,
  "results": [
    {
      "trackId": 1489481533,
      "artistName": "artistname",
      "trackName": "trackname",
      "feedUrl": "https://feedurl/feed",
      "artworkUrl100": "https://image/100x100bb.jpg",
      "artworkUrl600": "https://image/600x600bb.jpg",
      "releaseDate": "2020-01-19T09:00:00Z",
      "genres": ["News", "Podcasts"],
      "genreIds": ["1489", "26"]
    },
    ...
  ]
}
```

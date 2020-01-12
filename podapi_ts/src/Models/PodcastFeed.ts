import PodcastItem from "./PodcastItem";

export default interface PodcastFeed {
  title: string;
  lastBuild: string;
  description: string;
  image: string;
  owner: string;
  items: PodcastItem[];
}

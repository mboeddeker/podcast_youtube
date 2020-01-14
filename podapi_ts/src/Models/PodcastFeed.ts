import PodcastItem from "./PodcastItem";

// tslint:disable-next-line:interface-name
export default interface IPodcastFeed {
  title: string;
  lastBuild: string;
  description: string;
  image: string;
  owner: string;
  items: PodcastItem[];
}

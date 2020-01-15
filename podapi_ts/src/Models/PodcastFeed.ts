import PodcastFeedDTO from "./DTOs/PodcastFeedDTO";
import Model from "./Model";
import { IPodcastItem, PodcastItem } from "./PodcastItem";

// tslint:disable-next-line:interface-name
export interface IPodcastFeed {
  title: string;
  lastBuild: string;
  description: string;
  image: string;
  owner: string;
  items: IPodcastItem[];
}

export class PodcastFeed extends Model<PodcastFeedDTO> implements IPodcastFeed {
  public title: string;
  public lastBuild: string;
  public description: string;
  public image: string;
  public owner: string;
  public items: PodcastItem[];

  constructor(dto: PodcastFeedDTO) {
    super(dto);
  }

  public mapFromDTO(dto: PodcastFeedDTO): void {
    const channelValue = dto.rss.channel;
    this.title = channelValue.title;
    this.lastBuild = channelValue.lastBuildDate;
    this.description = channelValue.description;
    this.image = channelValue.image.url;
    this.owner = channelValue.owner.name;
    this.items = channelValue.item.map(item => new PodcastItem(item));
  }
}

import { JsonProperty } from "json-object-mapper";
import ItemDTO from "./DTOs/ItemDTO";
import Model from "./Model";

// tslint:disable-next-line:interface-name
export interface IPodcastItem {
  title: string;
  subTitle: string;
  description: string;
  summary: string;
  pubDate: string;
  link: string;
  guid: string;
  episode: number;
  mediaUrl: string;
}

export class PodcastItem extends Model<ItemDTO> implements IPodcastItem {
  @JsonProperty()
  public title: string;

  @JsonProperty()
  public subTitle: string;

  @JsonProperty()
  public description: string;

  @JsonProperty()
  public summary: string;

  @JsonProperty()
  public pubDate: string;

  @JsonProperty()
  public link: string;

  @JsonProperty()
  public guid: string;

  @JsonProperty()
  public episode: number;

  @JsonProperty()
  public mediaUrl: string;

  constructor(dto: ItemDTO) {
    super(dto);
  }
  public mapFromDTO(dto: ItemDTO): void {
    this.title = dto.title;
    this.subTitle = dto.subTitle;
    this.description = dto.description;
    this.summary = dto.summary;
    this.pubDate = dto.pubDate;
    this.link = dto.link;
    this.guid = dto.guid;
    this.episode = dto.expisode;
    this.mediaUrl = dto.mediaUrl;
  }
}

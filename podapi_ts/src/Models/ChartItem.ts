import ILookupItem from "./LookupItem";
import { JsonProperty, JsonIgnore } from "json-object-mapper";

// tslint:disable-next-line:interface-name
export default interface IChartItem {
  id: string;
  title: string;
  summary: string;
  artist: string;
  thumbnails: string[];
  releaseDate: string;
  category: string;
  lookup: ILookupItem;
}

export class ChartItem implements IChartItem {
  @JsonProperty({ name: "id" })
  public id: string;

  @JsonProperty({ name: "title" })
  public title: string;

  @JsonProperty({ name: "summary" })
  public summary: string;

  @JsonProperty({ name: "im:artist" })
  public artist: string;

  @JsonProperty({ name: "im:image" })
  public thumbnails: string[];

  @JsonProperty({ name: "im:releaseDate" })
  public releaseDate: string;

  public category: string;
  public lookup: ILookupItem;
}

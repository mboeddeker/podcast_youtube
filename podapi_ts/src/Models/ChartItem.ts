import { JsonIgnore, JsonProperty } from "json-object-mapper";
import StringMap from "../Interfaces/StringMapInterface";
import EntryDTO from "./DTOs/EntryDTO";
import { ILookupItem } from "./LookupItem";
import Model from "./Model";

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

export class ChartItem extends Model<EntryDTO> implements IChartItem {
  @JsonProperty()
  public id: string;

  @JsonProperty()
  public title: string;

  @JsonProperty()
  public summary: string;

  @JsonProperty()
  public artist: string;

  @JsonProperty()
  public thumbnails: string[];

  @JsonProperty()
  public releaseDate: string;

  @JsonProperty()
  public category: string;

  @JsonProperty()
  public lookup: ILookupItem;

  constructor(dto: EntryDTO) {
    super(dto);
  }

  public mapFromDTO(dto: EntryDTO): void {
    this.id = dto.id.id;
    this.title = dto.title;
    this.summary = dto.summary;
    this.thumbnails = dto.image.map(imageDTO => imageDTO.text);
    this.releaseDate = dto.releaseDate.label;
    this.category = dto.category.label;

    if (typeof dto.artist === "object") {
      this.artist = ((dto.artist as unknown) as StringMap)["#text"];
    } else if (typeof dto.artist === "string") {
      this.artist = dto.artist as string;
    }
  }
}

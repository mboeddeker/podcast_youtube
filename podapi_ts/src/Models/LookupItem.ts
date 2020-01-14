import { JsonProperty } from "json-object-mapper";
import LookupItemDTO from "./DTOs/LookupItemDTO";
import Model from "./Model";

// tslint:disable-next-line:interface-name
export interface ILookupItem {
  trackId: number;
  artistName: string;
  trackName: string;
  feedUrl: string;
  artworkUrl100: string;
  artworkUrl600: string;
  releaseDate: string;
  genres: string[];
  genreIds: string[];
}

export class LookupItem extends Model<LookupItemDTO> implements ILookupItem {
  @JsonProperty()
  public trackId: number;

  @JsonProperty()
  public artistName: string;

  @JsonProperty()
  public trackName: string;

  @JsonProperty()
  public feedUrl: string;

  @JsonProperty()
  public artworkUrl100: string;

  @JsonProperty()
  public artworkUrl600: string;

  @JsonProperty()
  public releaseDate: string;

  @JsonProperty()
  public genres: string[];

  @JsonProperty()
  public genreIds: string[];

  constructor(dto: LookupItemDTO) {
    super(dto);
  }

  public mapFromDTO(dto: LookupItemDTO): void {
    this.trackId = dto.trackId;
    this.artistName = dto.artistName;
    this.trackName = dto.trackName;
    this.feedUrl = dto.feedUrl;
    this.artworkUrl100 = dto.artworkUrl100;
    this.artworkUrl600 = dto.artworkUrl600;
    this.releaseDate = dto.releaseDate;
    this.genres = dto.genres;
    this.genreIds = dto.genreIds;
  }
}

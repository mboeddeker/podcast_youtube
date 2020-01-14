import { JsonProperty } from "json-object-mapper";

class LookupItemDTO {
  @JsonProperty()
  public trackId: number = undefined;

  @JsonProperty()
  public artistName: string = undefined;

  @JsonProperty()
  public trackName: string = undefined;

  @JsonProperty()
  public feedUrl: string = undefined;

  @JsonProperty()
  public artworkUrl100: string = undefined;

  @JsonProperty()
  public artworkUrl600: string = undefined;

  @JsonProperty()
  public releaseDate: string = undefined;

  @JsonProperty()
  public genres: string[] = undefined;

  @JsonProperty()
  public genreIds: string[] = undefined;
}

export default LookupItemDTO;

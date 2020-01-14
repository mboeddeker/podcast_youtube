import { JsonProperty } from "json-object-mapper";
import ArtistDTO from "./ArtistDTO";
import CategoryDTO from "./CategoryDTO";
import ContentDTO from "./ContentDTO";
import IdDTO from "./IdDTO";
import ImageDTO from "./ImageDTO";
import ReleaseDateDTO from "./ReleaseDateDTO";

class EntryDTO {
  @JsonProperty()
  public updated: string;

  @JsonProperty({ type: IdDTO })
  public id: IdDTO = undefined;

  @JsonProperty()
  public title: string = undefined;

  @JsonProperty()
  public summary: string = undefined;

  @JsonProperty()
  public name: string = undefined;

  @JsonProperty({ type: CategoryDTO })
  public category: CategoryDTO = undefined;

  @JsonProperty()
  public artist: ArtistDTO | string = undefined;

  @JsonProperty({ type: ImageDTO })
  public image: ImageDTO[] = undefined;

  @JsonProperty({ type: ReleaseDateDTO })
  public releaseDate: ReleaseDateDTO = undefined;

  @JsonProperty({ type: ContentDTO })
  public content: ContentDTO = undefined;
}

export default EntryDTO;

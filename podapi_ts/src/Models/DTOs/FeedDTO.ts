import "reflect-metadata";
import { JsonIgnore, JsonProperty } from "json-object-mapper";
import AuthorDTO from "./AuthorDTO";
import EntryDTO from "./EntryDTO";

class FeedDTO {
  @JsonProperty({ name: "@_lang" })
  public lang: string = undefined;

  @JsonProperty()
  public id: string = undefined;

  @JsonProperty()
  public title: string = undefined;

  @JsonProperty()
  public updated: string = undefined;

  @JsonProperty()
  public icon: string = undefined;

  @JsonProperty({ type: AuthorDTO })
  public author: AuthorDTO = undefined;

  @JsonProperty()
  public rights: string = undefined;

  @JsonProperty({ type: EntryDTO })
  public entry: EntryDTO[] = undefined;
}

export default FeedDTO;

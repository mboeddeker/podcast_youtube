import { JsonProperty } from "json-object-mapper";

class FeedImageDTO {
  @JsonProperty()
  public url: string = undefined;

  @JsonProperty()
  public title: string = undefined;

  @JsonProperty()
  public link: string = undefined;
}

export default FeedImageDTO;

import { JsonProperty, JsonIgnore } from "json-object-mapper";
import FeedDTO from "./FeedDTO";

class FeedResponseDTO {
  @JsonProperty({ type: FeedDTO })
  public feed: FeedDTO = undefined;
}

export default FeedResponseDTO;

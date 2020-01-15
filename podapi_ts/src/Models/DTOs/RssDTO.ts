import { JsonProperty } from "json-object-mapper";
import ChannelDTO from "./ChannelDTO";

class RssDTO {
  @JsonProperty({ type: ChannelDTO })
  public channel: ChannelDTO = undefined;
}

export default RssDTO;

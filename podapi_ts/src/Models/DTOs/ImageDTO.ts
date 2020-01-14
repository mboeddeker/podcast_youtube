import { JsonProperty } from "json-object-mapper";

class ImageDTO {
  @JsonProperty({ name: "#text" })
  public text: string = undefined;

  @JsonProperty({ name: "@_height" })
  public height: string = undefined;
}

export default ImageDTO;

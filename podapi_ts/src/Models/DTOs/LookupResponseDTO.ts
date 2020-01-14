import { JsonProperty } from "json-object-mapper";
import LookupItemDTO from "./LookupItemDTO";

class LookupResponseDTO {
  @JsonProperty()
  public resultCount: number = undefined;

  @JsonProperty({ type: LookupItemDTO })
  public results: LookupItemDTO[] = undefined;
}

export default LookupResponseDTO;

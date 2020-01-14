import { JsonProperty } from "json-object-mapper";
import LookupResponseDTO from "./DTOs/LookupResponseDTO";
import { ILookupItem, LookupItem } from "./LookupItem";
import Model from "./Model";

// tslint:disable-next-line:interface-name
export interface ILookupResponse {
  resultCount: number;
  results: ILookupItem[];
}

export class LookupResponse extends Model<LookupResponseDTO>
  implements ILookupResponse {
  @JsonProperty()
  public resultCount: number;

  @JsonProperty({ type: LookupItem })
  public results: LookupItem[];

  constructor(dto: LookupResponseDTO) {
    super(dto);
  }

  public mapFromDTO(dto: LookupResponseDTO): void {
    this.resultCount = dto.resultCount;
    this.results = dto.results.map(itemDTO => new LookupItem(itemDTO));
  }
}

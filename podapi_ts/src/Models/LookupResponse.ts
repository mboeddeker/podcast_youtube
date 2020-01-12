import LookupItem from "./LookupItem";

export default interface LookupResponse {
  resultCount: number;
  results: LookupItem[];
}

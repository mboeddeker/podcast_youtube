import LookupItem from "./LookupItem";

// tslint:disable-next-line:interface-name
export default interface ILookupResponse {
  resultCount: number;
  results: LookupItem[];
}

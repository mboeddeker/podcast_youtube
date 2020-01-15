import { NextFunction, Request, Response, Router } from "express";
import asyncHandler from "express-async-handler";
import Controller from "../Interfaces/ControllerInterface";
import ITunesService from "../Services/ITunesService";

class SearchController implements Controller {
  public path: string = "/search";
  public router = Router();
  private service: ITunesService;

  constructor(service: ITunesService = new ITunesService()) {
    this.service = service;
    this.initializeController();
  }

  private initializeController() {
    this.router.get(this.path, this.getSearch);
  }

  private getSearch = asyncHandler(
    async (req: Request, res: Response, next: NextFunction) => {
      const searchTerm: string = req.query.searchTerm ?? "";
      const country: string = req.query.country ?? "de";
      const explicit: boolean = Boolean(req.query.explicit) ?? true;

      try {
        const lookupResponse = await this.service.search(
          searchTerm,
          country,
          explicit
        );
        res.send(lookupResponse.toJson());
      } catch (error) {
        res.status(500).send(`Error with ChartsResponse: ${error}`);
      }
    }
  );
}

export default SearchController;

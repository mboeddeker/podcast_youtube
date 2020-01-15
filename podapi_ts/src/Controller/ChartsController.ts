import { NextFunction, Request, Response, Router } from "express";
import asyncHandler from "express-async-handler";
import Controller from "../Interfaces/ControllerInterface";
import { ChartResponse } from "../Models/ChartResponse";
import { LookupResponse } from "../Models/LookupResponse";
import ITunesService from "../Services/ITunesService";

class ChartsController implements Controller {
  public path: string = "/charts";
  public lookupPath: string = "/lookup";
  public router: Router = Router();
  private service: ITunesService;

  constructor(service: ITunesService = new ITunesService()) {
    this.service = service;
    this.initializeController();
  }

  private initializeController() {
    this.router.get(this.path, this.getCharts);
    this.router.get(this.path + "/lookup", this.getLookup);
  }

  private getCharts = asyncHandler(
    async (req: Request, res: Response, next: NextFunction) => {
      const language: string = req.query.language;
      const limit: number = Number(req.query.limit ?? "30");
      const explicit: boolean = Boolean(req.query.explicit);
      const genre: string = req.query.genre;
      const withLookup: boolean = Boolean(req.query.withLookup);

      try {
        const chartsResponse: ChartResponse = await this.service.getTopPodcasts(
          language,
          limit,
          explicit,
          genre,
          withLookup
        );
        res.send(chartsResponse.toJson());
      } catch (error) {
        res.status(500).send(`Error with ChartsResponse: ${error}`);
      }
    }
  );

  private getLookup = asyncHandler(
    async (req: Request, res: Response, next: NextFunction) => {
      const id: string = req.query.id;
      try {
        const lookupResponse: LookupResponse = await this.service.getLookup(id);
        res.send(lookupResponse.toJson());
      } catch (error) {
        res.status(500).send(`Error with ChartsResponse: ${error}`);
      }
    }
  );
}

export default ChartsController;

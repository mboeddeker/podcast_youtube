import { NextFunction, Request, Response, Router } from "express";
import * as asyncHandler from "express-async-handler";
import Controller from "../Interfaces/ControllerInterface";
import ITunesService from "../Services/ITunesService";

class ChartsController implements Controller {
  public path: string = "/charts";
  public router: Router = Router();
  private service: ITunesService;

  constructor(service: ITunesService = new ITunesService()) {
    this.service = service;
    this.initializeController();
  }

  private initializeController() {
    this.router.get(this.path, this.getCharts);
  }

  private getCharts = asyncHandler(
    async (req: Request, res: Response, next: NextFunction) => {
      const obj = await this.service.getTopPodcasts();
      res.send(obj);
    }
  );
}

export default ChartsController;

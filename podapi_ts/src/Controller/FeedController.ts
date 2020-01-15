import { NextFunction, Request, Response, Router } from "express";
import asyncHandler from "express-async-handler";
import Controller from "../Interfaces/ControllerInterface";
import FeedService from "../Services/FeedService";

import ITunesService from "../Services/ITunesService";

class FeedController implements Controller {
  public path: string = "/feed";
  public router = Router();
  private service: FeedService;
  private iTunesService: ITunesService;

  constructor(
    service: FeedService = new FeedService(),
    itunesService: ITunesService = new ITunesService()
  ) {
    this.service = service;
    this.iTunesService = itunesService;
    this.initializeController();
  }

  private initializeController() {
    this.router.get(this.path, this.getFeed);
  }

  private getFeed = asyncHandler(
    async (req: Request, res: Response, next: NextFunction) => {
      const id: string = req.query.id;
      try {
        const lookup = await this.iTunesService.getLookup(id);
        const feedResponse = await this.service.getFeed(
          lookup.results[0].feedUrl
        );

        res.send(feedResponse.toJson());
      } catch (error) {
        res.status(500).send(`Error with FeedResponse: ${error}`);
      }
    }
  );
}

export default FeedController;

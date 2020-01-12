import * as express from "express";
import Controller from "../Interfaces/ControllerInterface";
import ITunesService from "../Services/ITunesService";

class HealthController implements Controller {
  public path = "/health";
  public router = express.Router();

  constructor() {
    this.initializeController();
  }

  

  private initializeController() {
    this.router.get(this.path, this.getHealth);
    this.router.get(this.path + "/test", this.getHealthT);
    this.router.get()
  }

  private getHealth = async (
    request: express.Request,
    response: express.Response,
    next: express.NextFunction
  ) => {
    response.status(200).json({ status: "fine" });
  };

  private getHealthT = async (
    request: express.Request,
    response: express.Response,
    next: express.NextFunction
  ) => {
    const service = new ITunesService();
    var val = await service.getTopPodcasts();
    console.log(val);
    response.send(val);
  };
}

const asyncRoute = route:express.RequestHandler => (request: express.Request,
  response: express.Response,
  next: express.NextFunction = console.error) =>
  Promise.resolve(route(req, res)).catch(next)

export default HealthController;

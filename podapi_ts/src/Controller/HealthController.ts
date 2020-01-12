import * as express from "express";
import Controller from "../Interfaces/ControllerInterface";

class HealthController implements Controller {
  public path = "/health";
  public router = express.Router();

  constructor() {
    this.initializeController();
  }

  private initializeController() {
    this.router.get(this.path, this.getHealth);
  }

  private getHealth = async (
    request: express.Request,
    response: express.Response,
    next: express.NextFunction
  ) => {
    response.status(200).json({ status: "fine" });
  };
}

export default HealthController;

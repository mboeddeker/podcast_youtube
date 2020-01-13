/* tslint:disable:member-ordering */
import { NextFunction, Request, Response, Router } from "express";
import Controller from "../Interfaces/ControllerInterface";

class HealthController implements Controller {
  public path = "/health";
  public router = Router();

  constructor() {
    this.initializeController();
  }

  private initializeController() {
    this.router.get(this.path, this.getHealth);
  }

  private getHealth = async (
    request: Request,
    response: Response,
    next: NextFunction
  ) => {
    response.status(200).json({ status: "fine" });
  };
}

export default HealthController;

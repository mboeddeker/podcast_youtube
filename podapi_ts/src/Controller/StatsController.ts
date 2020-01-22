import { NextFunction, Request, Response, Router } from "express";
import Controller from "../Interfaces/ControllerInterface";

class StatsController implements Controller {
  public path: string = "/stats";
  public router: Router = Router();
}

import { Client, ExecuteResult } from "../deps.ts";
import { Plant } from "../models/Plant.ts";

export default class PlantController {
  private client!: Client;
  constructor(host: string)
  {
    new Client().connect({ 
      hostname: host,
      username: "root",
      db: "RoslinyMiododajne",
      password: Deno.env.get("MYSQL_ROOT_PASSWORD"),
    }).then((cli: Client) => this.client = cli);
  }
  public async getAllPlants(): Promise<Plant[]>
  {
    const data = await this.client.query(await Deno.readTextFile("./database/select-all.sql"));
    return data;
  }
}